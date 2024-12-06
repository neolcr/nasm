section .data
	pathname DD "/home/neolcr/Nasm/read/ejemplo"

section .text
global main

main:
	mov eax, 5
	mov ebx, pathname
	mov ecx, 0
	int 80h
