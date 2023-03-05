cmake_minimum_required(VERSION 3.1)
project(camCalib)

set(CMAKE_CXX_STANDARD 17)
find_package( OpenCV REQUIRED )
# find_package(CTello REQUIRED)

add_executable(calib cameraCalib.cpp)
target_link_libraries(calib ${OpenCV_LIBS})

# set(CMAKE_BUILD_TYPE Debug)
