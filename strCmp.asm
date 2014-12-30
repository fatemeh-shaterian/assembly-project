;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   recived:dx,bx               
;;   if cx == 0  then command is like echo
;;   use: si
;;;;;;;;;;;;;;;;;;;;;;;;

strCmp:
	;pusha
	mov bp,sp
	mov si, 0
	mov ax,0
	push bx
	.l1:
		pop bx
		mov ah,byte[bx+si]
		cmp ah, " "
		jne .down1
		push bx
		mov bx,dx
		mov al,byte[bx+si]
		cmp al,0
		jne .down2
		cmp cx,0        ;echo type
		je .equals
	.down1:
		push bx
		mov bx,dx
		mov al,byte[bx+si]
		.down2:
		cmp al,ah
		jne .notequal

		cmp byte[bx+si], 0
		je .equals
		inc si
        	jmp .l1

	.equals:
		mov bx , 1
		;mov si,onee
		;call printString
		jmp .toEnd

	.notequal:
		mov bx , 0
	.toEnd:
		mov sp,bp
ret

address dw 0
address_temp dw 0
