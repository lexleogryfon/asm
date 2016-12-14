format ELF64 executable 3

segment readable executable

entry main

include 'unistd64.inc'
include 'io.inc'
	
main:
	lea	rdi, [msg]	; address of msg in to rdi
	call	print
	lea	rdi, [ndline]
	call 	print
	xor	rdi, rdi	; exit code 0
	mov	rax, sys_exit		; sys_exit
	syscall
	
segment readable writable

msg	db 'Hello world!', 10, 0
ndline	db '2ndline', 10, 0
