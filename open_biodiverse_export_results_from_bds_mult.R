##########################################################################################################
# RUN THIS SCRIPT 8th
#
#
#This script uses a perl script to open biodiverse file and output results as csv.
setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/bdssepareted/basedata/")
#source("./R_release/biodiverse_path_reference.R")
n<- list.files(pattern="analysed.bds")
n[i]
setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/")

for (i in 1:99){
  

#Inputs:
  
input_bds_file <- paste0("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/bdssepareted/basedata/",n[i])


output_csv_prefix= paste0("snakes_analysed_",i) #the text to add to the begingin of the csv file name

#
#
#Nunzio.Knerr@csiro.au
#Date:1/07/2015
#
##########################################################################################################
#
#source("./R_release/biodiverse_path_reference.R")

cmd <- paste ("perl ", biodiverse_pipeline_install_folder, "/perl/load_bds_and_export_results.pl", sep="")

###### do not edit below #########
cmd <- paste(cmd, "--input_bds_file", shQuote(input_bds_file), "--output_csv_prefix", shQuote(output_csv_prefix), sep =" ")
              
print(cmd)
system(cmd, intern=FALSE, ignore.stdout=FALSE, ignore.stderr=FALSE, wait=TRUE) 
}
