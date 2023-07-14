FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install build-essential
RUN apt-get -y install unzip wget cmake

ENV PATH=$PATH:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib6412
ENV LIBRARY_PATH=$LIBRARY_PATH:/usr/local/cuda/lib64

ADD . /cv_test
WORKDIR /cv_test
RUN wget https://github.com/opencv/opencv/archive/refs/tags/4.8.0.zip
RUN unzip 4.8.0.zip
RUN wget -O opencv_extra_4.8.0.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/4.8.0.zip
RUN unzip opencv_extra_4.8.0.zip
RUN cd opencv-4.8.0 && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.8.0/modules .. \
    -DWITH_CUDA=1 \
    -DWITH_CUDNN=1 \
    -DCUDA_ARCH_BIN=8.6 \
    -DENABLE_FAST_MATH=1 \
    -DCUDA_FAST_MATH=1 \
    -DWITH_CUBLAS=1 \
    -DOPENCV_GENERATE_PKGCONFIG=1 \
    -DOPENCV_PC_FILE_NAME=opencv.pc \
    -DBUILD_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    .. && make -j4 && make install && ldconfig
