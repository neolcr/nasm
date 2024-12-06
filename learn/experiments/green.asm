section .data
    green db 0x1B, '[32m'          ; ANSI escape code for green text
    reset db 0x1B, '[0m'           ; ANSI escape code to reset color
    message db 'Hello, world!', 0xA ; Message with newline
    len_msg equ $ - message        ; Length of the message
    len_green equ $ - green        ; Length of green escape code
    len_reset equ $ - reset        ; Length of reset escape code

section .text
global _start

_start:
    ; Print green color code
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    lea rsi, [green]    ; pointer to green escape code
    mov rdx, len_green  ; length of escape code
    syscall

    ; Print the message
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    lea rsi, [message]  ; pointer to message
    mov rdx, len_msg    ; length of message
    syscall

    ; Reset text color
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    lea rsi, [reset]    ; pointer to reset escape code
    mov rdx, len_reset  ; length of reset code
    syscall

    ; Exit program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; exit code: 0
    syscall

