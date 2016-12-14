format ELF64 executable 3

segment readable executable

entry main

main:
	lea	rdi, [msg]	; address of msg in to rdi
	call	strlen		; put lenth of msg in to rax
	mov	rdx, rax	; move rax to rdx
	mov	rsi, rdi
	mov 	rdi, 1		; stdout
	mov	rax, 1		; sys_write
	syscall
	xor	rdi, rdi	; exit code 0
	mov	rax, 60		; sys_exit
	syscall
	
strlen:
	push	rdi		; push to stack
	push	rcx		; push to stack
	sub	rcx, rcx	; set tcx to 0
	mov 	rcx, -1		; move -1 to rcx
	sub 	al, al 		; set al to 0 (al is lower part (8bits) of rcx?
	cld 			; clear direction flags
	repne 	scasb		; look on string, char by char & repeat if not equal to al (0) (end of a string)
	neg	rcx		; negate rcx
	sub	rcx, 1		; subtract 1 from rcx
	mov	rax, rcx	; move value from rcx to rax
	pop	rcx		; restore original rcx val
	pop	rdi		; restore original rdi val
	ret

	
segment readable writable

msg	db 'Hello world!', 10, 0
