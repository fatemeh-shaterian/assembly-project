help0:

call clear
	mov byte[buffer],0dh
        call printChar
        mov byte[buffer],0ah
        call printChar
mov si,hShutDown
call printString
mov si,hEcho
call printString
mov si,hClear
call printString
mov si,hReset
call printString
mov si,hTime
call printString
mov si,hdate
call printString
mov si,hwho
call printString
mov si,hpassw
call printString
mov si,hchngusr
call printString
mov si,hhist
call printString
	mov byte[buffer],0dh
        call printChar
        mov byte[buffer],0ah
        call printChar
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;bx -> point to array
;;'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
help1:


add bx,5
push bx

mov dx , time
mov cx,1
call strCmp
cmp bx , 1
je .timeHelp

pop bx
push bx

mov dx , shutDown
mov cx,1
call strCmp
cmp bx , 1
je .shutDownHelp

pop bx
push bx

mov dx , Date
mov cx,1
call strCmp
cmp bx , 1
je .datehelp

pop bx
push bx

mov dx , passw
mov cx,1
call strCmp
cmp bx , 1
je .passhelp

pop bx
push bx

mov dx , changusername
mov cx,1
call strCmp
cmp bx , 1
je .usrhelp

pop bx
push bx

mov dx , whoT
mov cx,1
call strCmp
cmp bx , 1
je .whohelp

pop bx
push bx

mov dx , hist
mov cx,1
call strCmp
cmp bx , 1
je .histhelp

pop bx
push bx

mov dx , echoT
mov cx,0
call strCmp
cmp bx , 1
je .echoHelp

pop bx
push bx

mov dx , clearT
mov cx,1
call strCmp
cmp bx , 1
je .clearHelp

pop bx
push bx

mov dx , reset
mov cx,1
call strCmp
cmp bx , 1
je .resetHelp

pop bx

mov si,hError
call printString
jmp .toEnd

.timeHelp:

mov si, hTime
call printString
pop bx
jmp .toEnd

.whohelp:
mov si, hwho
call printString
pop bx
jmp .toEnd

.resetHelp:
mov si, hReset
call printString
pop bx
jmp .toEnd

.histhelp:
mov si, hhist
call printString
pop bx
jmp .toEnd

.usrhelp:
mov si, hchngusr
call printString
pop bx
jmp .toEnd

.passhelp:
mov si, hpassw
call printString
pop bx
jmp .toEnd

.datehelp:
mov si, hdate
call printString
pop bx
jmp .toEnd

.clearHelp:
mov si, hClear
call printString
pop bx
jmp .toEnd

.echoHelp:
mov si, hEcho
call printString
pop bx
jmp .toEnd

.shutDownHelp:
mov si, hShutDown
call printString
pop bx
jmp .toEnd


.toEnd:

ret

;----------------------------------
hShutDown 	db "shutdown - bring the system down",0ah,0dh,0
hEcho 		db "echo - display a line of text",0ah,0dh,0
hClear 		db "clear - clear the terminal screen",0ah,0dh,0
hReset 		db "reset - terminal initialization",0ah,0dh,0
hTime 		db "time - print the system time",0ah,0dh,"	-s ",0ah,0dh,"	locale's 12-hour clock time (e.g., 11:11:04 PM)",0ah,0dh,0
hdate		db "date - print the system date",0ah , 0dh , 0
hError 		db "What help page do you want?", 0ah , 0dh, 0
hwho		db "who am i - show who is logged on",0ah , 0dh ,0 
hpassw		db "passwd - change user password", 0ah, 0dh , 0

hchngusr	db "change username - changes the username of user who logged in.",0ah , 0dh , 0
hhist		db "history - History Library",0ah , 0dh , 0

       




