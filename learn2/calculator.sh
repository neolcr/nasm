#!/bin/zsh

rm calculator.o
rm calculator
nasm -f elf64 calculator.asm
ld calculator.o -o calculator
./calculator
