section .text
global _start

_start:
    xor rcx, rcx            ; Clear RCX (set it to 0)
    mov rcx, 5              ; Set loop counter to 5

print_loop:
    push rcx                ; Save RCX (loop counter) on the stack

    mov rax, 1              ; Syscall: write
    mov rdi, 1              ; File descriptor: stdout
    lea rsi, [char]         ; Address of the character
    mov rdx, 3              ; Length: 1 byte
    syscall                 ; Perform the write syscall

    pop rcx                 ; Restore RCX (loop counter) from the stack
    loop print_loop         ; Decrement RCX and loop if RCX > 0

    ; Exit the program
    mov rax, 60             ; Syscall: exit
    xor rdi, rdi            ; Exit code: 0
    syscall

section .data
    char db "*", 10, 0             ; Character to print
