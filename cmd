docker build -t opencv-cu:v1 .
nvidia-docker run -it -v /home/wai-f/VSCodeProjects/docker_opencv:/cv_test opencv_cu:v1 /bin/bash