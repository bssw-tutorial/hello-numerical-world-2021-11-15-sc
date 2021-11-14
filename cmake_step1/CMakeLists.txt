cmake_minimum_required(VERSION 3.8)

project(heat VERSION 0.5 LANGUAGES CXX)

# setup all cmake variables
option(BUILD_TESTS "Build the tests accompanying this program." OFF)

# generate heat.hh by substituting in cmake variables
configure_file(include/version.H.in include/version.H)

add_executable(heat args.C
                    crankn.C
                    exact.C
                    ftcs.C
                    heat.C
                    upwind15.C
                    utils.C)

# To include dependencies, e.g. MPI, use
#
# find_package(MPI 2.0 REQUIRED)
# target_link_libraries(cheat PUBLIC MPI::MPI_CXX)
# or
# target_link_libraries(fheat PUBLIC MPI::MPI_Fortran)
#
# Several packages are pre-defined by cmake, for example:
# https://cmake.org/cmake/help/latest/module/FindMPI.html

target_compile_features(heat PUBLIC cxx_std_11)
target_include_directories(heat
                           PUBLIC
                            ${CMAKE_CURRENT_SOURCE_DIR}/include
                            ${PROJECT_BINARY_DIR}/include
                          )

if(BUILD_TESTS)
  add_subdirectory(tests)
endif()

install(TARGETS heat
        DESTINATION bin)
