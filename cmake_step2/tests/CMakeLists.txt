enable_testing()

# define a function to simplify adding tests
# (which consist of add_executable/target_link_libraries/add_test commands)
function(do_test alg)
  add_test(NAME ${alg}
           COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/testDriver.sh $<TARGET_FILE:heat> ${alg})
endfunction(do_test)

do_test(ftcs)
do_test(crankn)
do_test(upwind15)
