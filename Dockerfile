FROM continuumio/miniconda3:23.3.1-0

LABEL maintainer="yanpd01@gmail.com"

RUN \
    conda install -y \
        -c bioconda -c conda-forge \
        fastp=0.23.2 fastqc=0.12.1 multiqc=1.14 \
        r=4.2 r-remotes r-tidyverse \
        bioconductor-phyloseq && \
    conda clean -a  && \
    Rscript -e \
        'remotes::install_github("jbisanz/qiime2R", upgrade = "never", quiet = TRUE)' && \
    rm -rf /tmp/*



