section .text
global _start

_start:
    ; 1. Print the text
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, variable   ; pointer to the string
    mov rdx, variable_len ; length of the string
    syscall

    ; 2. Print the length as a number
    mov rax, variable_len ; Load the length (12 in this case)
    call print_number      ; Call helper function to print the number

    ; 3. Print a newline after the number
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, newline    ; pointer to the newline character
    mov rdx, 1          ; length: 1 byte
    syscall

    ; Exit program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; exit status 0
    syscall

; Helper function to print a number in decimal
print_number:
    ; Inputs: rax = number to print
    ; Clobbers: rbx, rcx, rdx
    mov rbx, 10         ; Base 10
    xor rcx, rcx        ; Digit count
.next_digit:
    xor rdx, rdx        ; Clear rdx for division
    div rbx             ; Divide rax by 10 (rax = quotient, rdx = remainder)
    push rdx            ; Push remainder (digit) onto the stack
    inc rcx             ; Increment digit count
    test rax, rax       ; Check if quotient is 0
    jnz .next_digit     ; If not, repeat for the next digit

.print_digits:
    pop rax             ; Pop digit from stack
    add al, '0'         ; Convert digit to ASCII
    mov rsi, rsp        ; Temporarily use stack pointer for output
    mov byte [rsi], al  ; Store the digit as a byte
    mov rdx, 1          ; Print 1 byte
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    syscall
    loop .print_digits  ; Print all digits in reverse order
    ret

section .data
    variable db "Hola mundo", 10, 0 ; String with newline and null terminator
    variable_len equ $ - variable   ; Calculate the length of the string
    newline db 10                   ; Newline character
