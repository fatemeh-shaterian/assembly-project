enter_user:

pusha
mov bx,0
top:

mov si , m_user
call printString

mov di,user_temp
mov bx,user_temp
call getString   

mov si , m_pass
call printString

mov di,pass_temp;
mov bx , pass_temp
call getString 

mov bx,user1
mov dx,user_temp 
call strCmp
mov cx, bx
cmp bx,1
je .toPass1

mov bx,user2
mov dx,user_temp 
call strCmp
mov cx, bx
cmp bx,1
je .toPass2


.toPass1:
mov si,message2
call printString
mov bx,pass1
mov dx,pass_temp
call strCmp
jmp .toend

.toPass2:
mov si,message2
call printString
mov bx,pass2
mov dx,pass_temp
call strCmp
jmp .toend

.toend:
add bx , cx               
cmp bx,2
jne top
popa

ret
;%INCLUDE "console_io.asm"
%INCLUDE"strCmp.asm"

pass1 db '1234',0
user1 db"rez1",0
pass2 db '4321',0
user2 db"fatemeh",0
pass_temp times 100 db 0
user_temp  times 100 db 0
m_user db "Enter user name: ",0
m_pass db "Enter pass: ",0
message2 db "user or pass is not correct, try again!!!" , 0ah,0dh,0 
