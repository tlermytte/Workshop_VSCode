project(Workshop)
cmake_minimum_required(VERSION 3.1)

set(CMAKE_CXX_STANDARD 17)

if (UNIX)
    set(CMAKE_CXX_FLAGS "-W -Wall -Wextra -Werror")
endif (UNIX)

include_directories(include)

add_executable(test main.cpp)