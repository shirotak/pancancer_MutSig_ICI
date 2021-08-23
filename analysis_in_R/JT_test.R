getwd()
setwd("/Users/takamatsushiro/Desktop/pancancer_TMB_MSI_IRS/public_repository/pancancer_MutSig_ICI/analysis_in_R")
library(clinfun)
df=read.delim("./TCGA_smoking4_Sig4_ID3_for_JT_test.tsv",sep="\t")
df=df[!is.na(df$Smoking4_order),]
df$Smoking4_order=as.integer(df$Smoking4_order)
head(df)

# set seed
set.seed(777)

# calculation
dfw=matrix(nrow = 4,ncol = 3)
vec=c("CancerType","Sig4_ratio","ID3_ratio")
cancers=c("LUAD","LUSC","HNSC","BLCA")
n_perm=20000
for (i in 1:4){
  tmp=df[df$CancerType==cancers[i],]
  res1=jonckheere.test(x=tmp$Sig4_ratio,
                       g=tmp$Smoking4_order,
                       alternative = "increasing",
                       nperm = n_perm)
  res2=jonckheere.test(x=tmp$ID3_ratio,
                       g=tmp$Smoking4_order,
                       alternative = "increasing",
                       nperm = n_perm)
  add=c(cancers[i],as.character(res1$p.value),res2$p.value)
  dfw[i,]=add
} 
colnames(dfw)=c("CancerType","Sig4_ratio","ID3_ratio")
dfw
write.table(dfw,"JT_test_results_increasing_nperm20000.tsv",
            sep="\t",quote = F,row.names = F)
