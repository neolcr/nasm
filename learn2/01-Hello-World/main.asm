; Este programa pinta hola mundo
section .text
global _start

_start:
    mov rax, 1 ; 1 para write
    mov rdi, 1 ; 1 para stdin
    mov rsi, variable ; pointer to the string
    mov rdx, len  ; bytes
    syscall

    mov rsi, len ; bytes
    mov rax, 1 ; 1 para write
    mov rdi, 1 ; 1 para stdin
    mov rdx, len  ; bytes
    syscall

    mov rax, 60; 60 salir
    xor rdi, rdi ; 0 todo ok
    syscall


section .data
    variable db "Hola mundo soy el rey del mundo que tal", 10, 0 ; 10 newline , 0 terminator
    len equ $ - variable ; lenght
