getwd()
setwd("/Users/takamatsushiro/Desktop/pancancer_TMB_MSI_IRS/public_repo_old/pancancer_MutSig_ICI/analysis_in_R")
library(clinfun)
df=read.delim("./TCGA_smoking4_for_JT_test.tsv",sep="\t")
df=df[!is.na(df$Smoking4_order),]
df$Smoking4_order=as.integer(df$Smoking4_order)
head(df)

# set seed
set.seed(777)

# calculation
dfw=matrix(nrow = 4,ncol = 2)
vec=c("CancerType","Smoking_Sigs")
cancers=c("LUAD","LUSC","HNSC","BLCA")
n_perm=20000
for (i in 1:4){
  tmp=df[df$CancerType==cancers[i],]
  res1=jonckheere.test(x=tmp$Smoking_Sigs,
                       g=tmp$Smoking4_order,
                       alternative = "increasing",
                       nperm = n_perm)
  add=c(cancers[i],as.character(res1$p.value))
  dfw[i,]=add
} 
colnames(dfw)=c("CancerType","Smoking_Sigs")
dfw
write.table(dfw,"JT_test_results_TCGA_smoking4.tsv",
            sep="\t",quote = F,row.names = F)
