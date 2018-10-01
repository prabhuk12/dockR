#Install Rserve
 
#Include Rserve library
library(Rserve)
# Find if port has been set
port <- Sys.getenv("rserve_port");
if(port == ""){port = 6311;}
#Start Rserve
run.Rserve(debug = TRUE, port, remote="enable") 
#Port can also be specified in the configuration file.
library(rJava)
.jinit(); 
.jaddClassPath("/opt/semosshome/dockR/lib");
.jaddClassPath("/opt/semosshome/dockR/lib/zookeeper-3.4.5.jar");
.jaddClassPath("/opt/semosshome/dockR/lib/slf4j-api-1.6.1.jar");
.jaddClassPath("/opt/semosshome/dockR/lib/slf4j-log4j12-1.6.1");
rj <- .jnew("prerna/cluster/util/RJavaClient", check=TRUE)
rj$registerZK();
