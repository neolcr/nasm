; Este código solo es valido usando NASM en System V AMD64 ABI (Linux, macOS y otros basados en UNIX)
; En Microsoft x64 los registros se usan de forma diferente

; seccion para inicializar variables
section .data
    msg db "Introduce valor:", 10, 0
    len equ $ - msg

    nline db 10, 0
    lnline equ $ - nline

; seccion para espacio sin inicializar
section .bss
    buffer resb 5           ; espacio para 5 bytes (4 + 1 de nueva linea)
    result resb 20          ; espacio para 20 bytes

; seccion para funciones que hacen las cosas
section .text

global _start               ; hace publica (global) a está función principal (es como main en java o c)

_start:
    ; pintar "introduce valor:" con nueva linea (10), 0 es el null-terminator de la linea
    mov rax, 1              ; rax = 1 ( syscall 1 significa write en pantalla)
    mov rdi, 1              ; rdi = 1 (descriptor de archivo stdout 1 significa imprimir)
    mov rsi, msg            ; rsi = "Introduce valor: ", En realidad rsi tiene una dirección de memoria, es un puntero. la direccion de memoria es la 1º donde está "Introduce valor"
    mov rdx, len            ; rdx = numero de bytes de "Introduce valor:"
    syscall                 ; llama a función C del OS con: 1º paremtro rax, 2º param rdi, 3º param rsi, 4º param rdx

    ; leer input
    xor rax, rax            ; una forma eficiente (XOR siempre da cero cuando sus dos inputs son el mismo valor) de dejar 0 en rax, equivalente a mov rax, 0 -> rax = 0. Syscall 0 significa leer.
    mov rdi, 0              ; rdi = 1 (descriptor de archivo stdin 0 significa lear)
    mov rsi, buffer         ; rsi = buffer (espacio de memoria reservado para el input del usuario)
    mov rdx, 5              ; rdx = 5 (número de bytes que se le permite tener)
    syscall                 ; llama a funcion c del os con los parametros ya descritos

    ; Convertir input del usuario (string) a un entero
    xor rax, rax            ; rax = 0
    xor rbx, rbx            ; rbx = 0, se usará como variable temporal en las operaciones
    mov rsi, buffer         ; rsi = puntero a la direccion de memoria donde está almecenado el input del usuario
atoi_loop:
    mov bl, byte [rsi]      ; coger el primer byte (primer caracter del buffer)
    cmp bl, 0x0A            ; comparar y ver si bl == nueva linea (10 decimal == 0x0A hexa)
    je atoi_done            ; je es true si la comparación (cpm) fue true, si es true saltar a atoi_done (salir)
    sub bl, '0'             ; convertir ascii a entero mediante restarle 48 (48 == '0' en la tabla ascii) . por ejemplo si es un 1, un es 49 en ascii -> 49 - 48 = 1, etc
    imul rax, rax, 10       ; rax = rax * 10 (inicialmente rax == 0)
    add rax, rbx            ; rax = rax + rbx -> inicialmente 0 + rbx -> rbx contiene el digito tras -> mov bl , byte [rsi]. bl está dentro de rbx : RBX (64) > EBX (32) > BX (16) > [BH(8), BL(8)]
    inc rsi                 ; Incrementa + 1 la dirección de memoria que contiene rsi, Por ejemplo si contenia 0x10001, ahora contiene 0x10002 -> apunta al siguiente caracter de un byte
    jmp atoi_loop           ; vuelve a empezar hasta que llegue a nueva linea (fin)

atoi_done:
    ; Double the value
    add rax, rax

    ; Convert integer to string (itoa)
    xor rdx, rdx
    mov rbx, 10
    lea rsi, [result + 19] ; Point to the end of the result buffer
    mov byte [rsi], 0     ; Null-terminate the string
itoa_loop:
    xor rdx, rdx
    div rbx               ; Divide rax by 10
    add dl, '0'           ; Get the remainder and convert to ASCII
    dec rsi               ; Move backward in the buffer
    mov byte [rsi], dl    ; Store the digit
    test rax, rax         ; Check if quotient is zero
    jnz itoa_loop         ; Repeat until rax is zero

    ; Print the result
    mov rax, 1
    mov rdi, 1
    lea rdx, [result + 19] ; Calculate the string length
    sub rdx, rsi
    syscall

    ; print lnline
    mov rax, 1
    mov rdi, 1
    mov rsi, nline
    mov rdx, lnline
    syscall

    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall
