FROM debian:jessie

MAINTAINER Yiannis Mouchakis <gmouchakis@iit.demokritos.gr>

# Install packages.
RUN apt-get update && apt-get install -y \
            git \
            make \
            autoconf \
            libtool \
	    pkg-config \ 
	    libncurses5-dev \ 
	    libreadline6-dev \
	    zlib1g-dev \
	    uuid-dev \
	    libxml2-dev \
	    libglib2.0-dev \ 
	    libraptor2-dev \ 
	    librasqal3-dev \ 
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/*

# Install 4store
RUN git clone https://github.com/garlik/4store.git
WORKDIR 4store
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN make clean

# clean up
WORKDIR /
RUN rm -rf 4store

# create directory for 4store logs
RUN mkdir /var/log/4store

#Expose 4s-boss default port
EXPOSE 6733

# Define default command.
CMD ["bash"] 
