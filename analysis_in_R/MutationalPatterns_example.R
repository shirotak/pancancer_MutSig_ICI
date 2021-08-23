library(MutationalPatterns)
library(BSgenome)
ref_genome <-"BSgenome.Hsapiens.UCSC.hg38"
library(ref_genome, character.only = TRUE)
library(GenomicRanges)
library(data.table)

#example
args=commandArgs(trailingOnly = T)
maf=fread("../data/tcga_mafs/TCGA.ACC.mutect.somatic.maf")
#maf=fread(args[1])
if ( grepl("chr", maf$Chromosome[1])==F ) {
  maf$Chromosome=paste0("chr",maf$Chromosome)
} 
# remove indels
snp=maf$Variant_Type=="SNP"
maf=maf[snp,]
# adjust status
colnames(maf)[which( colnames(maf)=="Reference_Allele" )]="REF"
colnames(maf)[which( colnames(maf)=="Tumor_Seq_Allele2" )]="ALT"
# make grl
grl=makeGRangesListFromDataFrame(maf,
                                 keep.extra.columns=TRUE,
                                 ignore.strand=TRUE,
                                 seqinfo=NULL,
                                 seqnames.field=c("seqnames", "seqname","Chromosome"),
                                 start.field="Start_Position",
                                 end.field="End_Position",
                                 strand.field="Strand",
                                 starts.in.df.are.0based=FALSE,
                                 split.field = "Tumor_Sample_Barcode",
                                 names.field = "Hugo_Symbol")

GenomeInfoDb::genome(grl)="hg38"
# 96 mutational profile
mut_mat <- mut_matrix(vcf_list= grl, ref_genome =ref_genome)

# COSMIC mutational signatures
cancer_signatures = read.table("../data/cosmic_v2_signatures.tsv"
                               , sep = "\t", header = TRUE,row.names = 1)
#cancer_signatures = read.table(args[2],sep = "\t", header = TRUE,row.names = 1)
new_order = match(row.names(mut_mat), row.names(cancer_signatures))
cancer_signatures = cancer_signatures[as.vector(new_order),]
cancer_signatures = as.matrix(cancer_signatures[,3:ncol(cancer_signatures)])

#Fit mutation matrix to the COSMIC mutational signatures:
fit_res <- fit_to_signatures(mut_mat, cancer_signatures)

# write out contribution matrix
out_prefix="../results/ACC_mutect"
#out_prefix=args[3]
out_f=paste0(out_prefix,"_mutsig.txt")
write.table( t(fit_res$contribution), out_f
             ,sep="\t",quote = F,col.names = NA,row.names = T)
out_f2=paste0(out_prefix,"_96_muataions.txt")
write.table( t(mut_mat), out_f2
             ,sep="\t",quote = F,col.names = NA,row.names = T)
