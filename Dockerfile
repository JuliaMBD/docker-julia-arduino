FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND nointeractive
RUN apt-get update &&\
    apt-get install -y \
    python3 \
    cmake \
    git \
    curl \
    wget \
    bzip2 \
    g++ &&\
    apt-get clean &&\
    rm -fr /var/lib/apt/lists/*

RUN git clone https://github.com/JuliaLang/julia.git -b v1.8.3 --depth 1 &&\
    cd julia &&\
    sed -i 's/LLVM_TARGETS := host;NVPTX;AMDGPU;WebAssembly;BPF/LLVM_TARGETS := host;NVPTX;AMDGPU;WebAssembly;BPF;AVR/g' deps/llvm.mk &&\
    echo "USE_BINARYBUILDER_LLVM=0" >> Make.user &&\
    echo "JULIA_CPU_TARGET=generic;sandybridge,-xsaveopt,clone_all;haswell,-rdrnd,base(1)" >> Make.user &&\
    echo "prefix=/opt/julia" >> Make.user &&\
    make && make install &&\
    rm -fR /julia

ENV PATH /opt/julia/bin:$PATH

