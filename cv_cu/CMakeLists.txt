cmake_minimum_required(VERSION 3.8)

find_package(OpenCV REQUIRED)
include_directories( ${OpenCV_INCLUDE_DIRS})
add_executable(cv_test cv_test.cpp)
target_link_libraries(cv_test ${OpenCV_LIBS})