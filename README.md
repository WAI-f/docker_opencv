# docker_opencv
c++ cuda opencv docker

### 1. run dockerfile build docker image
- build Dockerfile: 
```
docker build -t opencv-cu:v1 .
```
dockerfile command include:
```
- pull base cuda11.8 image
- install some app for develop
- set cuda enviroment
- download opencv4.8.0 and build
```
### 2. run docker container
- run command:
```
nvidia-docker run -it opencv_cu:v1 /bin/bash
```
### 3. build test project & run
- all operation in docker container:
```
cd /cv_test/cv_cu
mkdir build
cd build
cmake ..
make
./cv_test
```