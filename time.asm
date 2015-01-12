hours db 0
minutes db 0
seconds db 0

timeString times 20 db 0
ts db "testing", 0

temp dw 0
;------------------------------
; recieve = ax
; if ax = 1 time -s
; if ax = 0 time 
;------------------------------
getTime:

	pusha
	mov [temp] , ax
	mov byte[timeString+10] , 0 
	mov ah , 2
	int 1ah
	;mov ax , 2c00h
	;int 21h
			;mov byte[hours] , ch 
			;mov byte[minutes] , cl
			;mov byte[seconds] , dh
	mov si , timeString
	cmp byte[temp] , 1
	jne down			;if time is called

	mov dx , 0			;if time -s is called
	movzx ax ,  ch
	sub ax , 12
	push ax
	add ax , 12
	cmp ax , 12
	jl d
	sub ax , 12
	d:
	

	mov ch , al

	down:
	
		push ax
		push bx
		push dx
		movzx ax,ch
		mov bx,24
		mov dx,0
		div bx
		mov ch,dl
		pop dx
		pop bx
		pop ax
		
		
		movzx ax , ch 		; byte[hours]
		call makeTime
		
		push ax
		push bx
		push dx
		movzx ax,cl
		mov bx,60
		mov dx,0
		div bx
		mov cl,dl
		pop dx
		pop bx
		pop ax
		
		movzx ax , cl		; byte[minutes]
		call makeTime



		push ax
		push bx
		;push dx
		movzx ax,dh
		mov bx,60
		mov dx,0
		div bx
		mov dh,dl
		;pop dx
		pop bx
		pop ax
		
		
		movzx ax , dh 		; byte[seconds] 
		call makeTime
	
		dec si
		mov byte[si] , " "

		cmp byte [temp] , 1		; if time is called
		jne simple

		pop ax				; if time -s is called
		inc si
		cmp ax , 0
		jge Pm
		mov byte[si] , 'A'
		jmp tar
		Pm:
		mov byte[si] , 'P'
		tar:

			inc si 
			mov byte[si] , 'M'
			inc si

		simple:				; puts \n at the end of timeString
			mov byte[si] , 0ah
			inc si
			mov byte[si] , 0dh

			mov si , timeString
			call printString


	popa

ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
makeTime:

mov bl, 10
div bl

or al , 30h
mov [si] , al
inc si
or ah , 30h
mov [si] , ah
inc si
mov byte[si] , ':'
inc si

ret
