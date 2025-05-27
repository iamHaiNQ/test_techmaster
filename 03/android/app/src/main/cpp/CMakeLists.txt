cmake_minimum_required(VERSION 3.4.1)

add_library(
        eight_queens
        SHARED
        eight_queens.c
)

# export symbols
set_target_properties(eight_queens PROPERTIES PUBLIC_HEADER eight_queens.h)

# Android NDK log support (if needed)
find_library(log-lib log)

target_link_libraries(
        eight_queens
        ${log-lib}
)
