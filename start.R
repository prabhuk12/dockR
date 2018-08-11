#Install Rserve
install.packages('Rserve', repos='http://cran.r-project.org')
 
#Include Rserve library
library(Rserve)
#Start Rserve
run.Rserve(debug = TRUE, 6311, remote="enable") 
#Port can also be specified in the configuration file.