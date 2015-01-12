;-----------------------
; si = source string
; di = destination string
; copys source string to destination string (null terminated strings)
;-----------------------
copy:
	pusha

	push si
	mov si , di
	call clearArray
	pop si

	.l1:
		mov al , byte[si]
		cmp al , 0
		je .out
		mov byte[di] , al
		inc si
		inc di
		jmp .l1

	.out:
		mov byte [di] , 0

	popa
ret
