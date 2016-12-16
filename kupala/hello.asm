
	
section .data
	text1 db "what is your name? ", 10
	text2 db "hello, "

section .bss
	name resb 16

section .text
	global _start

_start:

	call _printText1
	call _getName
	call _printText2
	call _printName
	
	mov rax, 60
	mov rdi, 0
	syscall

_printText1:
	mov rax, 1		; placing sycall number in to rax to call it
	mov rdi, 1		;arg1 stdout
	mov rsi, text1		;arg2 variable
	mov rdx, 19		;number of characters
	syscall			;calling sys_write with args in rdi, rsi, rdx
	ret			;returning to place where this subroutine was executed

_printText2:
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 7
	syscall
	ret

_printName:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_getName:
	mov rax, 0	;0 reading user input
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret
