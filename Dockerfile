FROM ubuntu:latest
RUN apt-get update 
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y git cmake pkg-config libprotobuf17 protobuf-compiler libprotobuf-dev libgoogle-perftools-dev build-essential
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/sentencepiece/
WORKDIR /opt/sentencpiece/
RUN git clone https://github.com/google/sentencepiece .
RUN mkdir build
WORKDIR /opt/sentencpiece/build/
RUN cmake ..
RUN make -j $(nproc)
RUN make install
RUN ldconfig -v
WORKDIR /opt/sentencepiece/
