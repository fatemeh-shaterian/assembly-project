; The first line of code in this file is executed after bootloader
; You should write your main loop here or in some function that is called here
;write code here

BITS 16
kernelMain:

    ; First we should set segments and stack
    ; Do not mess with these numbers!
    
    cli
    mov ax, 0
    mov ss, ax
    mov sp, 0FFFFh
    sti
    mov ax, 2000h
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

 ; Now we use our function to write an sample strings
 
call enter_user
; call shoutdown
call clear
tocall:
mov si,user
call printString
       mov si,massage
        call printString
    mov di,array
   mov bx,array
  call getString
jmp tocall

; Now we put cpu in halt state so the computer can be turned off
        cli
        hlt
; We must include our files in the end because this file in executed from first line
; so if we include them above the "kernelMain" all the codes in these files will be executed first

%INCLUDE "console_io.asm"
%INCLUDE"enter_user.asm"
%INCLUDE"clearScreen.asm"
%INCLUDE"shoutdown.asm"

sampleMessage: db 'first test', 0DH, 0Ah, 0
massage db '@sbu: $ ',0
array times 100 db 0

exitOS:

