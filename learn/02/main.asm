section .text
global _start

_start:
	mov rax, buffer	; para ser enviado a funcion como 1 parametro
	mov rdi, 80 ; para ser enviado a funcion como 2 parametro
	call read_console


	mov rdi, rax ; numero bytes (no necesariamente 80) retornado, está en rax
	mov rax, buffer ; 
	call write_console


	call exit	


	; cuando le llaman mueve los parametros de sitio
	read_console:
		mov rsi, rax ; mueve 1 param al lugar que tiene que tener para llamar a leer 
		mov rdx, rdi ; lo mismo con el 2 parametro 
		xor rax, rax ; una forma mas rapida de meterle 0 a rax (0 es leer) xor es 0 siempre que son iguales
		xor rdi, rdi ; una forma mas rapida de meterle 0 a rdi (0 es stdin)
		syscall
		ret

	; cuando le llaman mueve los parametros de sitio
	write_console:
		mov rsi, rax; rax tiene el 1 param
		mov rdx, rdi; rdi tiene el 2 param
		mov rax, 1; senal 1 escribir
		mov rdi, 1; senal 1 stdin
		syscall
		ret

	exit:
		mov rax, 60 ; exit
		mov rdi, 0 ; just for fun
		syscall 

section .bss
	buffer resb 80
