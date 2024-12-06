section .data
    myVar db "Hello", 10, 0        ; A null-terminated string

section .text
global _start

_start:
    lea rax, myVar           ; Load the address of 'myVar' into RAX

    ; Print the value of RAX as a number
    mov rdi, 1                 ; File descriptor (stdout)
    mov rsi, rax               ; Address in RAX becomes pointer to the string
    mov rdx, 6                 ; Length of "Hello" (number of bytes)
    mov rax, 1                 ; Syscall: write
    syscall

    mov rax, 60                ; Syscall: exit
    xor rdi, rdi               ; Exit code 0
    syscall
