section .text
global _start:
_start:
    ;print first msg
    mov rax, first_op;
    mov rdi, len_first_op
    call print

    ;read first op
    mov rax, buffer
    mov rdi, 1
    call read

    mov al, [buffer] ; load first byte
    sub al, '0' ; convert ascii to numeric value
    cmp al, 1 ; compare with 1
    je is_one;

    call exit

is_one:
    mov rax, one
    mov rdi, len_one
    call print
    jmp exit


; print value
; rax first op
; rdi sec op
print:
    mov rsi, rax ; move 1 param
    mov rdx, rdi; move 2 param
    mov rax, 1 ; write
    mov rdi, 1; file descriptor stdout
    syscall
    ret


; read value
read:
    mov rsi, rax; move 1 param
    mov rdx, rdi; move 2 param
    xor rax, rax; 0 syscall read
    xor rdi, rdi; 0 file descriptor stdin
    syscall
    ret


exit:
    mov rax, 60; 60 exit
    xor rdi, rdi; 0 ok
    syscall


section .data
    first_op db "Introduce el primer valor", 10, 0
    len_first_op equ $ - first_op
    one db "Metiste 1", 10, 0
    len_one equ $ - one

section .bss
	buffer resb 1
