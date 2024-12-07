cmake_minimum_required(VERSION 3.13)  # Minimum required for ASM_NASM support
project(NASMProject LANGUAGES C ASM_NASM)

# Specify the NASM assembly files
set(ASM_SOURCES
    calculator.asm
)

# Add an executable using the sources
add_executable(my_program ${ASM_SOURCES})

# Set NASM-specific flags
set(CMAKE_ASM_NASM_FLAGS "-f elf64")  # ELF64 for 64-bit Linux
