section .text
global _start

_start:
	mov rax, buffer
	mov rdi, 80
	call read_console

	mov rdi, rax ; mover el numero de bytes retornado por read_console al segundo parametro
	mov rax, buffer; setear el primer parametro
	call write_console


	call exit


read_console:
	mov rsi, rax; coger 1 param
	mov rdx, rdi; coger 2 param
	xor rax, rax; 0 es leer
	xor rdi, rdi; 0 es entrada stdin
	syscall
	ret


write_console:
	mov rsi, rax; coger 1 param
	mov rdx, rdi; coger 2 param
	mov rax, 1; 1 es escribir
	mov rdi, 1; 1 es salida stdout
	syscall
	ret

;convierte unsign int a string (base 10)
; inputs
;	rax: string
;	rdi: numero a convertir
; outputs
;	rax: string buffer con entero convertido a string
uitoa:
	; manejar cuando el numero es 0
	mov byte [rax], 48


exit:
	mov rax, 60
	xor rdi, rdi
	syscall



section .bss
	buffer resb 80
