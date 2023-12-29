cmake_minimum_required(VERSION 3.1)
project(camCalib)

set(CMAKE_CXX_STANDARD 17)
find_package( OpenCV REQUIRED )
find_package(nlohmann_json 3.2.0 REQUIRED)
# find_package(CTello REQUIRED)

add_executable(calib cameraCalib.cpp)
target_link_libraries(
    calib
    ${OpenCV_LIBS}
    nlohmann_json::nlohmann_json)

# set(CMAKE_BUILD_TYPE Debug)
