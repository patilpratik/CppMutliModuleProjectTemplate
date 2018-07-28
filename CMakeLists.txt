# min requirement

cmake_minimum_required(VERSION 3.1.0)

# project name
project (sample-multimodule-project)

set(PROJ_MAJOR_VERSION 0)
set(PROJ_MINOR_VERSION 1)
set(PROJ_PATCH_VERSION 0)
set(PROJ_VERSION
  ${PROJ_MAJOR_VERSION}.${PROJ_MINOR_VERSION}.${PROJ_PATCH_VERSION})

# set flag for complete build
option (COMPLETE_BUILD ON)

set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/build)
 
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})
 
set(PROJECT_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
 
include_directories("${PROJECT_INCLUDE_DIR}")
include_directories("${PROJECT_SOURCE_DIR}")
 
add_subdirectory(LibraryModule)
add_subdirectory(ExecutableModule)