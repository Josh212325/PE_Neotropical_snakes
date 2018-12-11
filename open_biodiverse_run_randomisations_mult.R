##########################################################################################################

# RUN THIS SCRIPT 7th
#
#This script uses a perl script to open biodiverse and run randomisations.
#Note: the perl script is part of the biodiverse distribution and resides there.
#Inputs:
#csv_file: the file conating the spatial data to load in
#out_file: the full path to the biodiverse basedata file (.bds) that should be generated.
#label_column_number: the column number for the labels, typically the taxon name
#group_column_number_x: the x co-ordinate column, could be latitude or metres
#group_column_number_y: the y co-ordinate column, could be longitude or metres
#cell_size_x: the x size of the group cell (in the same unit as the x co-ordinates)
#cell_size_y: the y size of the group cell (in the same unit as the y co-ordinates)
#
#
#Nunzio.Knerr@csiro.au
#Date:30/05/2015
#
##########################################################################################################
#
setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/bdssepareted/basedata/")

#source("./R_release/biodiverse_path_reference.R")
n<- list.files(pattern="analysed.bds")
n[i]
setwd("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/")

for (i in 1:99){
basedata <- paste0("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/bdssepareted/basedata/",n[i])

rand_name <- paste0("rand")

iterations <- 999

args <- paste0("function=rand_structured max_iters=999")
#

###### do not edit below #########
cmd <- paste("perl ", biodiverse_install_folder, "bin/run_randomisation.pl", sep="")

cmd <- paste(cmd, "--basedata", shQuote(basedata), "--rand_name", shQuote(rand_name), "--iterations", shQuote(iterations), "--args", args)
              
print(cmd)

system(cmd, intern=FALSE, ignore.stdout=FALSE, ignore.stderr=FALSE, wait=TRUE) 
}






################################
########## In parallel #########
################################


# for each
#install.packages('doMC', dependencies = T)
library(foreach)
library(doMC)

parallel::detectCores() ## A way of calling a function without loading the whole package
registerDoSEQ()
getDoParWorkers()
doParallel::registerDoParallel(cores=7)
getDoParWorkers()


foreach(i = 1:99) %dopar% {
  
  basedata <- paste0("/Users/josue/Dropbox/1Doutorado/Chapter_2/biodiverse_pipeline-master/bdssepareted/basedata/",n[i])
  rand_name <- paste0("rand")
  iterations <- 999
  args <- paste0("function=rand_structured max_iters=999")
  ###### do not edit below #########
  cmd <- paste("perl ", biodiverse_install_folder, "bin/run_randomisation.pl", sep="")

  cmd <- paste(cmd, "--basedata", shQuote(basedata), "--rand_name", shQuote(rand_name), "--iterations", shQuote(iterations), "--args", args)
  print(cmd)
  system(cmd, intern=FALSE, ignore.stdout=FALSE, ignore.stderr=FALSE, wait=TRUE) 
  
}

stopCluster(cl)


# Fasterst way to write files - Software club
saveRDS()
readRDS()






