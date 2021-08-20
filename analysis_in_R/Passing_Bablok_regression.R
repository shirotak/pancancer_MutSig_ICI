getwd()
setwd("/Users/takamatsushiro/Desktop/pancancer_TMB_MSI_IRS/public_repository/pancancer_MutSig_ICI/analysis_in_R/")
library(mcr)

df=read.delim("./Nature2018_BLCA_FM1_WES.tsv",sep="\t")

x=df$Missense_Mutation
y=df$FMOne.mutation.burden.per.MB

PB.reg <- mcreg(x,y, method.reg = "PaBa")
write.table(PB.reg@para,"./Passing_Bablok_results.tsv",sep="\t",col.names=NA,row.names=T,quote=F)

png("Passing_Bablok_regression.png")
plot(x,y, main ="Passing Bablok regression", ylab = "FM-ONE mut per MB", xlab = "WES Missense mutation")
abline(PB.reg@para[1:2], col = "red")
abline(PB.reg@para[5:6], col = "pink")
abline(PB.reg@para[7:8], col = "pink")
dev.off()
