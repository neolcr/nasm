section .data

    ; Messages

    msg1        db      10,'-Calculator-',10,0
    lmsg1       equ     $ - msg1

    msg2        db      10,'Number 1: ',0
    lmsg2       equ     $ - msg2

    msg3        db      'Number 2: ',0
    lmsg3       equ     $ - msg3

    msg4        db      10,'1. Add',10,0
    lmsg4       equ     $ - msg4

    msg5        db      '2. Subtract',10,0
    lmsg5       equ     $ - msg5

    msg6        db      '3. Multiply',10,0
    lmsg6       equ     $ - msg6

    msg7        db      '4. Divide',10,0
    lmsg7       equ     $ - msg7

    msg8        db      'Operation: ',0
    lmsg8       equ     $ - msg8

    msg9        db      10,'Result: ',0
    lmsg9       equ     $ - msg9

    msg10       db      10,'Invalid Option',10,0
    lmsg10      equ     $ - msg10

    nlinea      db      10,10,0
    lnlinea     equ     $ - nlinea

section .bss

    ; Spaces reserved for storing the values ​​provided by the user.

    opc:        resb    2
    num1:       resb    2
    num2:       resb    2
    result:     resb    2

section .text

    global _start

_start:

    ; Print on screen the message 1
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, lmsg1
    syscall

    ; Print on screen the message 2
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, lmsg2
    syscall

    ; We get num1 value.
    mov rax, 0
    mov rdi, 0
    mov rsi, num1
    mov rdx, 2
    syscall

    ; Print on screen the message 3
    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, lmsg3
    syscall

    ; We get num2 value.
    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 2
    syscall

    ; Print on screen the message 4
    mov rax, 1
    mov rdi, 1
    mov rsi, msg4
    mov rdx, lmsg4
    syscall

    ; Print on screen the message 5
    mov rax, 1
    mov rdi, 1
    mov rsi, msg5
    mov rdx, lmsg5
    syscall

    ; Print on screen the message 6
    mov rax, 1
    mov rdi, 1
    mov rsi, msg6
    mov rdx, lmsg6
    syscall

    ; Print on screen the message 7
    mov rax, 1
    mov rdi, 1
    mov rsi, msg7
    mov rdx, lmsg7
    syscall

    ; Print on screen the message 8
    mov rax, 1
    mov rdi, 1
    mov rsi, msg8
    mov rdx, lmsg8
    syscall

    ; We get the option selected.
    mov rdi,0
    mov rsi,opc
    mov rdx,2
    mov rax,0
    syscall

    mov ah, [opc]       ; Move the selected option to the registry ah
    sub ah, '0'     ; Convert from ascii to decimal

    ; We compare the value entered by the user to know what operation to perform.

    cmp ah, 1
    je add
    cmp ah, 2
    je subtract
    cmp ah, 3
    je multiply
    cmp ah, 4
    je divide

    ; If the value entered by the user does not meet any of the above
    ; conditions then we show an error message and we close the program.
    mov rax, 1
    mov rdi, 1
    mov rsi, msg10
    mov rdx, lmsg10
    syscall

    jmp exit

add:
    ; We keep the numbers in the registers al and bl
    mov al, [num1]
    mov bl, [num2]

    ; Convert from ascii to decimal
    sub al, '0'
    sub bl, '0'

    ; Add
    add al, bl

    ; Conversion from decimal to ascii
    add al, '0'

    ; We move the result
    mov [result], al

    ; Print on screen the message 9
    mov rax, 1
    mov rdi, 1
    mov rsi, msg9
    mov rdx, lmsg9
    syscall

    ; Print on screen the result
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 2
    syscall

    ; We end the program
    jmp exit

subtract:
    ; We keep the numbers in the registers al and bl
    mov al, [num1]
    mov bl, [num2]

    ; Convert from ascii to decimal
    sub al, '0'
    sub bl, '0'

    ; Subtract
    sub al, bl

    ; Conversion from decimal to ascii
    add al, '0'

    ; We move the result
    mov [result], al

    ; Print on screen the message 9
    mov rax, 1
    mov rdi, 1
    mov rsi, msg9
    mov rdx, lmsg9
    syscall

    ; Print on screen the result
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 1
    syscall

    ; We end the program
    jmp exit

multiply:

    ; We store the numbers in registers al and bl
    mov al, [num1]
    mov bl, [num2]

    ; Convert from ascii to decimal
    sub al, '0'
    sub bl, '0'

    ; Multiply. AX = AL x BL
    mul bl

    ; Conversion from decimal to ascii
    add ax, '0'

    ; We move the result
    mov [result], ax

    ; Print on screen the message 9
    mov rax, 1
    mov rdi, 1
    mov rsi, msg9
    mov rdx, lmsg9
    syscall

    ; Print on screen the result
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 1
    syscall

    ; We end the program
    jmp exit

divide:

    ; We store the numbers in registers ax and bx
    mov al, [num1]
    mov bl, [num2]

    mov dx, 0
    mov ah, 0

    ; Convert from ascii to decimall
    sub al, '0'
    sub bl, '0'

    ; Division. AL = AX / BX
    div bl

    ; Conversion from decimal to ascii
    add ax, '0'
    ; We move the result
    mov [result], ax

    ; Print on screen the message 9
    mov rax, 1
    mov rdi, 1
    mov rsi, msg9
    mov rdx, lmsg9
    syscall

    ; Print on screen the result
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 1
    syscall

    ; We end the program
    jmp exit

exit:
    ; Print on screen two new lines
    mov rax, 1
    mov rdi, 1
    mov rsi, nlinea
    mov rdx, lnlinea
    syscall
    ; End the program
    mov rax, 60
    mov rdi, 0
    syscall
