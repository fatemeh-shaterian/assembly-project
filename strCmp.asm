;;;;;;;;;;;;;;;;;;;;;;;;
; recieves:
; address = str1
; address_temp = str2
; returns:
; bx = 0 or 1		1 = true   0 = false


;my plan
;recived:dx,bx
;use: si
;;;;;;;;;;;;;;;;;;;;;;;;

strCmp:
;pusha
mov bp,sp
mov si, 0
mov ax,0
push bx
.l1:

;pop si
pop bx
mov ah,byte[bx+si]
push bx
mov bx,dx
mov al,byte[bx+si]
cmp al,ah
jne .notequal

cmp byte[bx+si], 0
je .equals
inc si

jmp .l1

.equals:
mov bx , 1
mov si,onee
call printString
jmp .toEnd


.notequal:
mov bx , 0
mov si, zeroo
call printString

.toEnd:
mov sp,bp


ret


address dw 0
address_temp dw 0
zeroo db "0",0
onee db '1',0
