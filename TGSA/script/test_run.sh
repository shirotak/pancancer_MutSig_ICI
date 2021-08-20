#!/bin/bash
python ../run_MSigPred.py -i ../test_data/input/cancer_sample01.vcf -o ../test_data/output/cancer_sample01 -v

python ../run_MSigPred.py -i ./test_path_to_cancer_samples_10.list -o ../test_data/output/cancer_samples_10 -sn ../test_data/input/sample_names_10.list -v

python ../run_MSigPred.py -i ../test_data/input/TCGA_mutect2_random100_1.maf -o ../test_data/output/TCGA_mutect2_random100_1 -v
