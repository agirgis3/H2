#Generate raw feature matrix from aaDist v. 9.2
setwd("/media/aag7319/WDRed/ZZZ_H2")

indexlist <- read.delim("./AAIndexData/v9.1/list_of_indices.txt")
indexlist <- indexlist[-c(1:2),1]

indices <- read.delim("./AAIndexData/v9.2/aaindex1.txt", header = FALSE)
indices <- indices[,1]

# ************************************************************************
#   * *
#   * Each entry has the following format. *
#   * *
#   * H Accession number *
#   * D Data description *
#   * R PMID *
#   * A Author(s) *
#   * T Title of the article *
#   * J Journal reference *
#   * * Comment or missing *
#   * C Accession numbers of similar entries with the correlation *
#   * coefficients of 0.8 (-0.8) or more (less). *
#   * Notice: The correlation coefficient is calculated with zeros *
#   * filled for missing values. *
#   * I Amino acid index data in the following order *
#   * Ala Arg Asn Asp Cys Gln Glu Gly His Ile *
#   * Leu Lys Met Phe Pro Ser Thr Trp Tyr Val *
#   * // *
#   ************************************************************************

indexAcc <- indices[grep('^H [0-9a-zA-Z]', indices)]; indexAcc <- substr(indexAcc,3,nchar(indexAcc))
indexNames <- indices[grep('^D [0-9a-zA-Z]', indices)]; indexNames <- substr(indexNames,3,nchar(indexNames))
