cmake_minimum_required(VERSION 3.20)
project(nix-cpp-dev LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(fmt REQUIRED)
find_package(nlohmann_json REQUIRED)

add_executable(main src/main.cpp)
target_link_libraries(main PRIVATE fmt::fmt)
target_link_libraries(main PRIVATE nlohmann_json::nlohmann_json)
