year dw 0
month db 0
day db 0
dayOfWeek db 0
dateString times 30 db 0
sep db 0ah , 0dh

getDate:
pusha

	;mov ax , 2a00h
	mov ah,4
	int 1ah
	;int 21h


		;mov word[year] , cx
		;mov byte[month] , dh
		;mov byte[day] , dl
		;mov byte[dayOfWeek] , al

mov si , dateString
mov ax , cx 		; 2015
mov bx , 1000
push dx
call makeDate
pop dx

mov byte [si] , '.'
inc si


movzx ax , dh		; 10
mov bx , 10
push dx
call makeDate
pop dx

mov byte [si] , '.'
inc si
	

movzx ax , dl		; 25
mov bx , 10
call makeDate
	
mov si , dateString
call printString

mov byte[buffer],0dh
        call printChar
        mov byte[buffer],0ah
        call printChar

popa
ret

;----------------------------
; recieve : ax  bx
;
;----------------------------
makeDate:

up:
mov dx , 0
div bx

or al, 30h
mov byte [si] , al
inc si
push dx
mov dx , 0

	
mov ax , bx
mov cx , 10
div cx
mov bx , ax
cmp bx , 10
pop dx
mov ax , dx
jge up

;inc si
or dl , 30h
mov byte[si] , dl
inc si
	
ret


