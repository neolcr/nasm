#!/bin/zsh
nasm -f elf64 "$1.asm" -o "$1.o"

