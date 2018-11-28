##########################################################################################################
## RUN THIS SCRIPT 5th
#
#This script uses a perl script to open biodiverse file and tree file and trime each to match eachother.
#Inputs:
setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/trees_separate/")
n<- list.files(pattern="bts")
n[i]
setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/bdssepareted")

for (i in 1:99){
input_bds_file = "/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/snakes_gridded_dist_epsg_3577.bds"

input_bts_file <- paste0("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/trees_separate/",n[i])


#Nunzio.Knerr@csiro.au
#Date:30/05/2015
#
##########################################################################################################
#
#source("./R_release/biodiverse_path_reference.R")

cmd <- paste ("perl ", biodiverse_pipeline_install_folder, "/perl/trim_bds_and_bts.pl", sep="")

output_bds_file <-  paste(substr(input_bds_file,1,nchar(input_bds_file)-4),"_trimmed",i,".bds",sep="")

output_bts_file <- paste(substr(input_bts_file,1,nchar(input_bts_file)-4), "_trimmed.bts",sep="") 

###### do not edit below #########
cmd = paste (cmd, "--input_bds_file", shQuote(input_bds_file ), "--input_bts_file", shQuote(input_bts_file), "--output_bds_file", shQuote(output_bds_file), "--output_bts_file", shQuote(output_bts_file))

system(cmd, intern=FALSE, ignore.stdout=FALSE, ignore.stderr=FALSE, wait=TRUE) 
}
