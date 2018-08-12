# Main Docker File for All the SEMOSS Pieces

# Start from the loaded R-Base-with-java
# Using R 3.5

FROM debian

LABEL maintainer="semoss@semoss.org"
 
 
# Install Java
# Install git
# Clone from prabhuk12/nginx need to change this once tim comes back
# Start listening

RUN echo "Starting install " 
RUN apt-get update	\
	&& apt-get install -y software-properties-common \
	&& apt-get install -y  openjdk-8-jdk \
	&& apt install -y wget \
	&& apt install -y git \
	&& apt install -y procps \
	&& apt install -y r-base \
	&& R CMD javareconf \
	&& mkdir /opt/semosshome \
	&& apt install -y libssl-dev \
	&& apt install -y libcurl4-openssl-dev \
	&& apt install -y vim \
	&& cd /opt/semosshome \
	&& git clone https://github.com/prabhuk12/dockR \
	&& cp /opt/semosshome/dockR/Rprofile.site /etc/R/Rprofile.site \
	&& cp /opt/semosshome/dockR/Rserve.conf /etc \
	&& Rscript /opt/semosshome/dockR/Packages.R \
	&& apt-get clean all
#	&& git clone https://github.com/prabhuk12/nginx

WORKDIR /opt/semosshome/dockR

CMD ["Rscript", "start.R"]
