# MSigPred
Mutational signature-based tumor genomic subtype prediction method for cancer samples.  
<img src=https://github.com/shirotak/MSigPred/blob/master/documentation/Pipeline_overview.p width="500">  
___
## Requirements & Preparations
### Python >= 3.7.4
- numpy
- pandas
- scipy
- matplotlib 
- sklearn
- joblib
- umap-learn
- rpy2
- IPython
#### Make classifiers in your environment
After installing the above requirements, you should configure classifiers and umap projector in your environment and save them as joblib files.
```
cd script
python MakeClassifiers.py
```
You can change hyper parameters of classifiers by editing this python script.  
By default, joblib files named KNN, SVC, RFC, LRC, and UMAP_projector are generated in the "lib" directory. 
### R >= 3.6.1
- MutationalPatterns
- BSgenome.Hsapiens.UCSC.hg19  
- BSgenome.Hsapiens.UCSC.hg38  
- GenomicRanges
#### Check that R works
Before using rpy2, you should check the behavior of R.  
For example,
```
cd script/R_script_for_test
Rscript MutationalPatterns_from_single_vcf.R
Rscript MutationalPatterns_from_list.R
Rscript MutationalPatterns_from_maf.R
```
___
## Usage
### Input file
[VCF file](https://en.wikipedia.org/wiki/Variant_Call_Format)(version >= 4.0) or [MAF file](https://docs.gdc.cancer.gov/Data/File_Formats/MAF_Format/) after somatic mutation calling are accepted.  
VCF file needs to contain a header starting with "##fileformat=VCFv**".  
The default genome version is GRCh38 (hg38), but genomeGRCh37 (hg19) is also accepted if you specify the option.
- single VCF file (end with ***.vcf)
- list of paths to multiple VCF files (end with ***.list)
- MAF file (end with ***.maf)
### Example
```
python run_MCPred.py -i input.vcf -o output_prefix [-sn samplename ]
python run_MCPred.py -i vcffiles.list -o output_prefix [-snl samplenames.list]
python run_MCPred.py -i input.maf -o output_prefix
```
### Output files
```
{output_prefix}_decomposed.tsv
{output_prefix}_prediction.txt
{output_prefix}_umap.png
```
___
## Test
```
cd script
bash test_run.sh
```
This will generates the following files in the "test/output" directory
-  [cancer_sample01_decomposed.tsv](https://github.com/shirotak/MCPred/blob/master/test_data/output/cancer_sample01_decomposed.tsv)
-  [cancer_sample01_predict.tsv](https://github.com/shirotak/MCPred/blob/master/test_data/output/cancer_sample01_prediction.txt)
-  cancer_sample01_umap.png
<img src=https://github.com/shirotak/MCPred/blob/master/test_data/output/cancer_sample01_umap.png width="350">

-  [cancer_samples_10_decomposed.tsv](https://github.com/shirotak/MCPred/blob/master/test_data/output/cancer_samples_10_decomposed.tsv)
-  [cancer_samples_10_table.tsv](https://github.com/shirotak/MCPred/blob/master/test_data/output/cancer_samples_10_prediction.txt)
-  cancer_samples_10_umap.png  
<img src=https://github.com/shirotak/MCPred/blob/master/test_data/output/cancer_samples_10_umap.png width="350">  

-  [TCGA_mutect2_random100_1_decomposed.tsv](https://github.com/shirotak/MCPred/blob/master/test_data/output/TCGA_mutect2_random100_1_decomposed.tsv)
-  [TCGA_mutect2_random100_1_table.tsv](https://github.com/shirotak/MCPred/blob/master/test_data/output/TCGA_mutect2_random100_1_prediction.txt)
-  TCGA_mutect2_random100_1_umap.png
<img src=https://github.com/shirotak/MCPred/blob/master/test_data/output/TCGA_mutect2_random100_1_umap.png width="350">  

___
## Getting Help  
```
python run_MCPred.py -h
```
___
## LICENCE
