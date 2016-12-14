format ELF64 executable 3

segment readable executable

entry main

main:
	lea	rdi, [msg]	; address of msg in to rdi
	mov	rax, 14		; put lenth of msg in to rax
	mov	rdx, rax	; move rax to rdx
	mov	rsi, rdi
	mov 	rdi, 1		; stdout
	mov	rax, 1		; sys_write
	syscall
	xor	rdi, rdi	; exit code 0
	mov	rax, 60		; sys_exit
	syscall

	
segment readable writable

msg	db 'Hello world!', 10, 0
