setTime:

mov si, timeMassage
call printString
mov di, inTime
mov dx,inTime
mov dl,0
call getString

;---------------------------------------------------------
mov si, inTime
call printString                ;ok

;-------------------------------------
;mov si,e
;call printString
 
;mov si, hourTemp
;call printString
;mov si,minTemp
;call printString
;mov si,secTemp
;call printString
;----------------------------------

call separateString             ;ok

mov bx,hourTemp
call convertToInt
;call CON

mov ch, al
mov bx,minTemp
call convertToInt
;call CON

mov cl,al
mov bx,secTemp
call convertToInt
;call CON

mov dh, al

mov dl,0

mov ah, 03h                     ;;input
int 1ah

call getTime

ret
;--------------------------------------------------------------
separateString:

pusha 

mov bx, inTime
mov si,hourTemp
.h:
mov al,byte[bx]
push bx
mov bx,si
mov byte[bx],al
pop bx
inc si
inc bx
cmp byte[bx], ':'
jne .h


inc bx
mov si,minTemp
.m:
mov al,byte[bx]
push bx
mov bx,si
mov byte[bx],al
pop bx
inc si
inc bx
cmp byte[bx], ':'
jne .m

mov cx,2
inc bx
mov si,secTemp

.s:
mov al,byte[bx]
push bx
mov bx,si
mov byte[bx],al
pop bx
inc si
inc bx
loop .s

popa

ret

;------------------------------------------
; bx point to string that should convert
;use ax
;result in al or ax
;-------------------------------------------------------------------
convertToInt:
        
        mov al, byte[bx]
        sub al,48
        
        push cx
        mov cl,10
        mul cl
        pop cx
        inc bx
        mov ah,byte[bx]
        sub ah,48
        add al,ah
        mov ah,0
       
        
        .end:
      
        
ret

;-----------------------------------------
;convert number in al
;
;--------------------------------------------
CON:
        cmp al,10
        jl .out
        cmp al,16
        jl .change
        
        
        .change:
        sub al,3
        jmp .out
        
        .out:
ret


inTime times 10 db 0
;e db "//////////////",0ah,0dh,0
hourTemp db "00",0
minTemp db "00",0
secTemp db "00",0
b db "12 shod",0ah,0dh,0
timeMassage db "Enter time in following order:  xx:xx:xx",0ah,0dh,0
