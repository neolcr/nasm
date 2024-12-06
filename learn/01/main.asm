section .text
global _start

_start:
	; leer entrada
	mov rax, 0 ; enviar 0 (leer)
	mov rdi, 0 ; enviar 0 (stdin)
	mov rsi, buf ; enviar direccion de buf
	mov rdx, 2 ; tamano del buf
	syscall


	; pintar la salida
	mov rax, 1 ; enviar 1 (escribir)
	mov rdi, 1 ; enviar 1 (stout)	
	mov rdx, 2  ; tamano del buffer, que todavia esta en rdi aqui
	syscall

	; salir
	mov rax, 60 ; salir
	mov rdi, 0  ; salir con codigo 0
	syscall

section .bss
	buf resb 2 
