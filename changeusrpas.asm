;------------------------------------
; recieves : nothing
; returns : nothing
; changes username
;------------------------------------
changeusr:

	pusha
		mov bx , user_temp
		mov dx , user1
		call strCmp
		cmp bx , 1
		je .d
		mov ax , user2
		jmp .dd
		.d:
		mov ax , user1
		.dd:
		push ax

		mov si , user_temp
		call printString

		mov si , eupass
		call printString

		mov di , tmp
		mov bx , tmp
		mov dl , 1
		call getString

		mov dx , pass_temp
		call strCmp

		cmp bx , 0
		je .down

		jmp .e
		.again:
		mov si , valid
		call printString
		.e:

			mov si , enewusr
			call printString

			mov di,tmp
			mov bx,tmp
			mov dl , 0
			call getString  
	
			mov dx , user1
			call strCmp

			cmp bx , 1
			je .cannot

			mov dx , user2
			call strCmp

			cmp bx , 1
			je .cannot

			jmp .chang

		.cannot: 

		jmp .again

		.chang:

			pop ax
			mov si , tmp
			mov di , ax 		 ; user1 or user2
			call copy
			
			mov si , tmp
			mov di , user_temp
			call copy

			mov si , userchanged
			call printString
			jmp .r

		.down:
			pop ax
			mov si , incorrect
			call printString

		.r:

	popa
ret


;------------------------------------
; recieves : nothing
; returns : nothing
; changes password
;-----------------------------------
changepass:

	pusha

	mov bx , user_temp
	mov dx , user1
	call strCmp
	cmp bx , 1
	je .d
	mov ax , pass2
	jmp .dd
	.d:
	mov ax , pass1
	.dd:
	push ax


	mov si , elastpass
	call printString

	mov di , tmp
	mov bx , tmp
	mov dl , 1
	call getString

	mov dx , pass_temp
	call strCmp

	cmp bx , 0
	je .end

	mov si, enewpass 
	call printString

	mov di , tmp
	mov bx , tmp
	mov dl , 1
	call getString

	mov si , reenenwpass
	call printString

	mov di , tmp2
	mov bx , tmp2
	mov dl , 1
	call getString
	
	mov dx , tmp
	call strCmp

	cmp bx , 1
	je .down

	mov si , err
	call printString

	jmp .end

	.down:
		pop ax
		mov si ,tmp
		mov di , ax
		call copy

		jmp .e
	.end: 
		pop ax
		mov si , incorrect
		call printString
		jmp .ee
	.e: 
		mov si ,passchanged
		call printString
	.ee:

popa
ret


eupass 		db " 's password :" , 0
incorrect 	db "ur passwrd is incorrect!",0ah , 0dh , 0
enewusr 	db "Enter new username :" , 0
tmp times 100 	db 0
tmp2 times 100 	db 0
valid 		db "sorry this user is available now." , 0ah, 0dh,"Try another username :" , 0
userchanged 	db "your username has been changed successfully." ,0ah, 0dh, 0

elastpass 	db "(current) UNIX password: " , 0
enewpass 	db "Enter new UNIX password: ",0
reenenwpass 	db "Retype new UNIX password: ",0
err 		db "passwd: Sorry, passwords do not match",0ah ,0dh , 0
passchanged 	db "your password has been changed successfully." , 0ah ,0dh ,0


