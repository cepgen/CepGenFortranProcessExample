cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(CepGenGrapeProcess)
enable_language(Fortran)

set(CEPGEN_PATH ${CEPGEN_PATH} $ENV{CEPGEN_PATH})
if(NOT PROCESS_NAME)
  set(PROCESS_NAME FortranProcess)
endif()
set(CMAKE_MODULE_PATH ${CEPGEN_PATH}/cmake)
find_package(CepGen REQUIRED)

file(GLOB SOURCES *.cpp)
file(GLOB_RECURSE F77_SOURCES src/*.f)

add_library(CepGen${PROCESS_NAME} SHARED ${SOURCES} ${F77_SOURCES})
target_link_libraries(CepGen${PROCESS_NAME} PRIVATE ${CepGen_LIBRARIES})
target_include_directories(CepGen${PROCESS_NAME} PRIVATE ${CepGen_INCLUDE_DIRS})
