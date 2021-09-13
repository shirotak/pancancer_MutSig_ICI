getwd()
setwd("/Users/takamatsushiro/Desktop/pancancer_TMB_MSI_IRS/public_repository/pancancer_MutSig_ICI/analysis_in_R")
library(clinfun)
df=read.delim("./CPTAC_smoking.tsv",sep="\t")
df=df[!is.na(df$Smoking3_order),]
df
df$Smoking3_order=as.integer(df$Smoking3_order)
head(df)

# set seed
set.seed(777)

# calculation
dfw=matrix(nrow = 3,ncol = 2)
vec=c("CancerType","Sig4_ratio")
cancers=c("LUAD","LUSC","non-lung cancer")
n_perm=20000
for (i in 1:3){
  tmp=df[df$CancerType_lung==cancers[i],]
  res1=jonckheere.test(x=tmp$Signature4_ratio,
                       g=tmp$Smoking3_order,
                       alternative = "increasing",
                       nperm = n_perm)
  add=c(cancers[i],as.character(res1$p.value))
  dfw[i,]=add
} 
colnames(dfw)=c("CancerType","Sig4_ratio")
dfw
write.table(dfw,"JT_test_results_increasing_nperm20000_CPTAC.tsv",
            sep="\t",quote = F,row.names = F)
