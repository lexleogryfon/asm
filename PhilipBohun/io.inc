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

print:
	call	strlen		; put string lenght to rax
	mov	rdx, rax	; move string lenght to rdx
	mov	rsi, rdi	; move adress of string to rdi
	mov	rdi, 1		; stdout
	mov	rax, sys_write	; sys_write
	syscall
	ret

read:
	mov	rdx, rdi	; buffer to read
	mov	rdi, 0		; stdin
	mov	rax, sys_read
	syscall
	ret