##########################################################################################################
# RUN THIS SCRIPT 6th
#
#This script uses a perl script to open biodiverse file and run the analyses you want.
#Inputs:

setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/trees_separate/")
n<- list.files(pattern="trimmed.bts")
n[i]
setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/bdssepareted")
p<- list.files(pattern="bds")
p[i]
setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master")

for (i in 1:99){

input_bds_file <- paste0("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/bdssepareted/",p[i])

input_bts_file <- paste0("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/trees_separate/",n[i])

#calcs: A comma delimited list of the calculations/analyses you want to compute.
#       List of calc names can be found on the biodiverse indicies page
#       https://code.google.com/p/biodiverse/wiki/Indices
#       listed as Subroutine: 
#       For example "Subroutine: calc_endemism_central" 
#
#Nunzio.Knerr@csiro.au
#Date:30/05/2015
#
##########################################################################################################
#
#source("./R_release/biodiverse_path_reference.R")

calcs <- paste("calc_endemism_whole,calc_pd,calc_pe,calc_phylo_rpd1,calc_phylo_rpd2,calc_phylo_rpe1,calc_phylo_rpe2")#,calc_phylo_rpe2_branch_stats

#calcs = paste("calc_numeric_label_stats")

cmd <- paste ("perl ", biodiverse_pipeline_install_folder, "/perl/run_analyses.pl", sep="")
#
#
###### do not edit below #########


cmd <- paste(cmd, "--input_bds_file", shQuote(input_bds_file), "--input_bts_file", shQuote(input_bts_file), "--calcs", shQuote(calcs), sep =" ")

print(cmd)

my_list<- system(cmd, intern=FALSE, ignore.stdout=FALSE, ignore.stderr=FALSE, wait=TRUE) 
}

str(my_list)
