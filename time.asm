hours db 0
minutes db 0
seconds db 0

year dw 0
month db 0
day db 0
dayOfWeek db 0
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
	mov ax , 2c00h
	int 21h
			;mov byte[hours] , ch 
			;mov byte[minutes] , cl
			;mov byte[seconds] , dh
	mov si , timeString
	cmp byte[temp] , 1
	jne down			;if time is called

	mov dx , 0			;if time -s is called
	movzx ax , ch
	mov bx , 2
	div bx
	push ax

	mov ch , dl

	down:
		movzx ax , ch 		; byte[hours]
		call makeTime

		movzx ax , cl 		; byte[minutes]
		call makeTime

		movzx ax , dh 		; byte[seconds] 
		call makeTime
	
		dec si
		mov byte[si] , " "

		cmp byte [temp] , 1		; if time is called
		jne simple

		pop ax				; if time -s is called
		inc si
		cmp ax , 1
		je Pm
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

;date

	mov ax , 2a00h
	int 21h


mov word[year] , cx
mov byte[month] , dh
mov byte[day] , dl
mov byte[dayOfWeek] , al

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
