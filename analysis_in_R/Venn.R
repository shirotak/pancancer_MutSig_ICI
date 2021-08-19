getwd()
#setwd("/Users/takamatsushiro/Desktop/pancancer_TMB_MSI_IRS/public_repository/pancancer_MutSig_ICI/analysis_in_R")
library(VennDiagram)

df=read.delim("./TCGA_4callers_8clusters_counts_for_R_Venn.tsv")

m2_1=  rownames( df[df$Mutect2=="SMK",])
m2_2=  rownames( df[df$Mutect2=="UVL",])
m2_3=  rownames( df[df$Mutect2=="APB",])
m2_4=  rownames( df[df$Mutect2=="POL",])
m2_5=  rownames( df[df$Mutect2=="MRD",])
m2_6=  rownames( df[df$Mutect2=="HRD",])
m2_7=  rownames( df[df$Mutect2=="DNS",])
m2_8=  rownames( df[df$Mutect2=="AGE",])

ms_1=  rownames( df[df$MuSE=="SMK",])
ms_2=  rownames( df[df$MuSE=="UVL",])
ms_3=  rownames( df[df$MuSE=="APB",])
ms_4=  rownames( df[df$MuSE=="POL",])
ms_5=  rownames( df[df$MuSE=="MRD",])
ms_6=  rownames( df[df$MuSE=="HRD",])
ms_7=  rownames( df[df$MuSE=="DNS",])
ms_8=  rownames( df[df$MuSE=="AGE",])

vs_1=  rownames( df[df$VarScan2=="SMK",])
vs_2=  rownames( df[df$VarScan2=="UVL",])
vs_3=  rownames( df[df$VarScan2=="APB",])
vs_4=  rownames( df[df$VarScan2=="POL",])
vs_5=  rownames( df[df$VarScan2=="MRD",])
vs_6=  rownames( df[df$VarScan2=="HRD",])
vs_7=  rownames( df[df$VarScan2=="DNS",])
vs_8=  rownames( df[df$VarScan2=="AGE",])

ss_1=  rownames( df[df$SomaticSniper=="SMK",])
ss_2=  rownames( df[df$SomaticSniper=="UVL",])
ss_3=  rownames( df[df$SomaticSniper=="APB",])
ss_4=  rownames( df[df$SomaticSniper=="POL",])
ss_5=  rownames( df[df$SomaticSniper=="MRD",])
ss_6=  rownames( df[df$SomaticSniper=="HRD",])
ss_7=  rownames( df[df$SomaticSniper=="DNS",])
ss_8=  rownames( df[df$SomaticSniper=="AGE",])

# check overlapping
c1=list("Mutect2"=m2_1,"MuSE"=ms_1,"VarScan2"=vs_1,"SomaticSinper"=ss_1)
c2=list("Mutect2"=m2_2,"MuSE"=ms_2,"VarScan2"=vs_2,"SomaticSinper"=ss_2)
c3=list("Mutect2"=m2_3,"MuSE"=ms_3,"VarScan2"=vs_3,"SomaticSinper"=ss_3)
c4=list("Mutect2"=m2_4,"MuSE"=ms_4,"VarScan2"=vs_4,"SomaticSinper"=ss_4)
c5=list("Mutect2"=m2_5,"MuSE"=ms_5,"VarScan2"=vs_5,"SomaticSinper"=ss_5)
c6=list("Mutect2"=m2_6,"MuSE"=ms_6,"VarScan2"=vs_6,"SomaticSinper"=ss_6)
c7=list("Mutect2"=m2_7,"MuSE"=ms_7,"VarScan2"=vs_7,"SomaticSinper"=ss_7)
c8=list("Mutect2"=m2_8,"MuSE"=ms_8,"VarScan2"=vs_8,"SomaticSinper"=ss_8)

# output prefix
out="../results/Venn_diagrames_for"
cname="SMK"
png()
venn.diagram(c1,filename=paste0(out,"_",cname,".png"),height=280,width = 350,
             margin=0.05,fill=c(0), alpha=0.4,lwd=0.5, lty=1,resolution = 300,
             fontfamily="Helvetica",cat.fontfamily="Helvetica",cex=0.35,cat.cex = 0.35)
dev.off()

cnames=c("SMK","UVL","APB","POL","MRD","HRD","DNS","AGE")

png()
venn.diagram(c2,filename=paste0(out,"_",cnames[2],".png"),height=280,width = 350,
             margin=0.05,fill=c(0), alpha=0.4,lwd=0.5, lty=1,resolution = 300,
             fontfamily="Helvetica",cat.fontfamily="Helvetica",cex=0.35,cat.cex = 0.35)
dev.off()


png()
venn.diagram(c3,filename=paste0(out,"_",cnames[3],".png"),height=280,width = 350,
             margin=0.05,fill=c(0), alpha=0.4,lwd=0.5, lty=1,resolution = 300,
             fontfamily="Helvetica",cat.fontfamily="Helvetica",cex=0.35,cat.cex = 0.35)
dev.off()


png()
venn.diagram(c4,filename=paste0(out,"_",cnames[4],".png"),height=280,width = 350,
             margin=0.05,fill=c(0), alpha=0.4,lwd=0.5, lty=1,resolution = 300,
             fontfamily="Helvetica",cat.fontfamily="Helvetica",cex=0.35,cat.cex = 0.35)
dev.off()


png()
venn.diagram(c5,filename=paste0(out,"_",cnames[5],".png"),height=280,width = 350,
             margin=0.05,fill=c(0), alpha=0.4,lwd=0.5, lty=1,resolution = 300,
             fontfamily="Helvetica",cat.fontfamily="Helvetica",cex=0.35,cat.cex = 0.35)
dev.off()

png()
venn.diagram(c6,filename=paste0(out,"_",cnames[6],".png"),height=280,width = 350,
             margin=0.05,fill=c(0), alpha=0.4,lwd=0.5, lty=1,resolution = 300,
             fontfamily="Helvetica",cat.fontfamily="Helvetica",cex=0.35,cat.cex = 0.35)
dev.off()

png()
venn.diagram(c7,filename=paste0(out,"_",cnames[7],".png"),height=280,width = 350,
             margin=0.05,fill=c(0), alpha=0.4,lwd=0.5, lty=1,resolution = 300,
             fontfamily="Helvetica",cat.fontfamily="Helvetica",cex=0.35,cat.cex = 0.35)
dev.off()


png()
venn.diagram(c8,filename=paste0(out,"_",cnames[8],".png"),height=280,width = 350,
             margin=0.05,fill=c(0), alpha=0.4,lwd=0.5, lty=1,resolution = 300,
             fontfamily="Helvetica",cat.fontfamily="Helvetica",cex=0.35,cat.cex = 0.35)
dev.off()

