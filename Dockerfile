FROM ubuntu:18.10
RUN apt-get update && apt-get install -y git cmake pkg-config libprotobuf10 protobuf-compiler libprotobuf-dev libgoogle-perftools-dev && rm -rf /var/lib/apt/lists/*
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
