
;---------------------
; recieve : nothig
; return : nothing
; puts the last instuction in history into prompt
;---------------------
upper:
pusha

mov si , his

; comes to the end of his
.up1:
cmp byte[si] , 0
je .out1
inc si
jmp .up1

.out1:
; comes to head of last instruction
sub si , 3
.up2:
cmp byte[si] , '>'
je .out2
dec si
jmp .up2

.out2:

; copys last instruction to array
add si , 2

mov bx , array
.up3:
mov al , [si]
cmp al , 0ah
je .out3
push si
mov si , bx
mov [si] , al
pop si
inc bx
inc si
jmp .up3

.out3:
push si 
mov si , array
call printString
pop si

popa
ret
dal db "$$",0

