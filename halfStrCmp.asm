;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;bx point to array
;;dx point to static string-command
;;return bx,si
;;use si,ax,dx,bx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

halfCmp:

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

		inc si
		pop bx
      		push bx
		cmp byte[bx+si],0
		je .equals
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
