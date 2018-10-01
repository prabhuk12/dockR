# Main Docker File for All the SEMOSS Pieces

# Using R 3.3.3 - or the latest stable on Debian

FROM debian


LABEL maintainer="semoss@semoss.org"
 
 
# Install Java
# Install git
# Clone from prabhuk12/nginx need to change this once tim comes back
# Start listening

RUN echo "Starting install " 
RUN apt-get update	\
	&& apt-get install -y software-properties-common \
	# Need Java for rJava
	&& apt-get install -y  openjdk-8-jdk \
	&& apt install -y wget \
	&& apt install -y git \
	&& apt install -y procps \
	&& apt install -y r-base \
	&& R CMD javareconf \
	&& mkdir /opt/semosshome \
	# the open SSL libraries dont come pre-installed with debian
	&& apt install -y libssl-dev \
	&& apt install -y libcurl4-openssl-dev \
	&& apt install -y vim \
	&& cd /opt/semosshome \
	&& git clone https://github.com/prabhuk12/dockR \
	# to ensure it doesn't ask for CRAN
	&& cp /opt/semosshome/dockR/Rprofile.site /etc/R/Rprofile.site \
	&& cp /opt/semosshome/dockR/Rserve.conf /etc \
	&& Rscript /opt/semosshome/dockR/Packages.R \
	&& apt-get clean all

WORKDIR /opt/semosshome/dockR

CMD ["Rscript", "start.R"]
