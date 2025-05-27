cmake_minimum_required(VERSION 3.4.1)

add_library(
        selection_sort
        SHARED
        selection_sort.c
)

# Xuất symbols cho JNI/FFI (nếu cần)
find_library(
        log-lib
        log
)

target_link_libraries(
        selection_sort
        ${log-lib}
)
