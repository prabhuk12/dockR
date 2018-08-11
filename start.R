#Install Rserve
 
#Include Rserve library
library(Rserve)
#Start Rserve
run.Rserve(debug = TRUE, 6311, remote="enable") 
#Port can also be specified in the configuration file.