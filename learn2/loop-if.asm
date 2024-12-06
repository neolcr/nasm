section .text
global _start

_start:
    xor rcx, rcx            ; Clear RCX (set it to 0)
    mov rcx, 5              ; Set loop counter to 5

print_loop:
    push rcx                ; Save RCX (loop counter) on the stack

    cmp rcx, 1              ; Compare RCX with 1 (last iteration is RCX == 1)
    je print_char2          ; If RCX == 1, jump to print_char2

    ; Print the default character (inline)
    mov rax, 1              ; Syscall: write
    mov rdi, 1              ; File descriptor: stdout
    lea rsi, [char1]        ; Address of the character
    mov rdx, 1              ; Length: 1 byte (only the '*')
    syscall                 ; Perform the write syscall
    jmp continue_loop       ; Skip the alternate print

print_char2:
    ; Print the alternate character (with newline)
    mov rax, 1              ; Syscall: write
    mov rdi, 1              ; File descriptor: stdout
    lea rsi, [char2]        ; Address of the alternate character
    mov rdx, 2              ; Length: 2 bytes ('*' and newline)
    syscall                 ; Perform the write syscall

continue_loop:
    pop rcx                 ; Restore RCX (loop counter) from the stack
    loop print_loop         ; Decrement RCX and loop if RCX > 0

    ; Exit the program
    mov rax, 60             ; Syscall: exit
    xor rdi, rdi            ; Exit code: 0
    syscall

section .data
    char1 db "*"             ; Default character to print inline
    char2 db "*", 10         ; Alternate character to print with newline
