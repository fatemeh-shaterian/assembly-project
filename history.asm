;------------------
; recieves : bx points to a null terminated string
; adds a line of string to his
; returns : nothing
;-----------------
addTohistory:
	pusha

	mov cx , word [ptr]
	push bx
	mov bx , cx
	mov byte [bx] , ' '
	inc bx
	mov byte [bx] , '-'
	inc bx
	mov byte [bx] , '-'
	inc bx
	mov byte [bx] , '>'
	inc bx
	mov byte [bx] , ' '
	inc bx
	mov cx , bx
	pop bx

	.up:

		mov al , byte[bx]
		push bx
		mov bx , cx
		mov byte[bx] , al
		pop bx
		inc bx
		inc cx
		cmp byte [bx] , 0
		je .out
	jmp .up

	.out:
		mov bx , cx
		mov byte[bx] , 0ah
		inc bx
		mov byte[bx] , 0dh
		inc bx
		mov word[ptr] , bx
		
		popa
ret

showhistory:

pusha

mov si , his
call printString

popa

ret


his times 2000 db 0
ptr dw his
