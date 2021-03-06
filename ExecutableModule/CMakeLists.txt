# min requirement

cmake_minimum_required(VERSION 3.1.0)

# project name
project (sample-executable)


if ( COMPLETE_BUILD STREQUAL "ON")
  set( WORKING_DIR "${CMAKE_CURRENT_SOURCE_DIR}/")
  set (PROJECT_GLOBAL_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include) 
else ()
  set (WORKING_DIR ../LibraryModule)
  set (PROJECT_GLOBAL_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/../include) 
endif ()


set(PROJ_MAJOR_VERSION 0)
set(PROJ_MINOR_VERSION 1)
set(PROJ_PATCH_VERSION 0)
set(PROJ_VERSION
  ${PROJ_MAJOR_VERSION}.${PROJ_MINOR_VERSION}.${PROJ_PATCH_VERSION})

# setting prefix to make all path references relative to current dir
SET(CMAKE_INSTALL_PREFIX "./" CACHE INTERNAL "Prefix prepended to install directories" FORCE)

set (PACKAGE_ARTIFACTS Package/Deliverable/artifacts)
set (PROJECT_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
set (PROJECT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

# get sources
# Find source files
file(GLOB SOURCES src/*.cpp)
 
include_directories("${PROJECT_BINARY_DIR}")
include_directories("${PROJECT_INCLUDE_DIR}")
include_directories("${PROJECT_GLOBAL_INCLUDE_DIR}")


# linking to the sample-library
# set the path to the library folder
link_directories("${WORKING_DIR}/lib")

add_executable(${PROJECT_NAME} ${SOURCES})
# link the libraries to the executable
target_link_libraries (${PROJECT_NAME} sample-library)

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin)
install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_SOURCE_DIR}/${PACKAGE_ARTIFACTS}/bin)
