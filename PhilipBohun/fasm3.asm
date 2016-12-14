format ELF64 executable 3

segment readable executable

entry main

include 'unistd64.inc'
include 'io.inc'
	
main:
	lea	rdi, [prompt]
	call 	print
	lea	rsi, [buf]
	mov	rdi, 64		; size of buffer
	call 	read
	mov	rdi, rsi 	; move string we read to rdi
	call 	print

	xor	rdi, rdi	; exit code 0
	mov	rax, sys_exit	; sys_exit
	syscall
	
segment readable writable

prompt	db	'please type your name: ', 0
buf	rb 	64
