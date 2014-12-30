help0:

call clear
mov si,hShutDown
call printString
mov si,hEcho
call printString
mov si,hClear
call printString
mov si,hReset
call printString
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

.resetHelp:
mov si, hReset
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


hShutDown db "Enter command to shutdown kernel.",0ah,0dh,0
hEcho db "Enter echo command to ???",0ah,0dh,0
hClear db "Enter clear command to ",0ah,0dh,0
hReset db "Enter reset command to ",0ah,0dh,0
hTime db "Enter time command to    dkjfldfj laskjf kkj        -s dare ....",0ah,0dh,0
hError db "what do you want???"
