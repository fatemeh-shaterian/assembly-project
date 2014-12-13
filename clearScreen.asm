clear:
pusha 
mov cx,20
.l1:
mov esi,spaces
call printString
mov byte[buffer] ,0DH
call printChar
mov byte[buffer] ,0Ah
call printChar
loop .l1
mov ah,02
mov dh,0
mov dl,0
int 10h
popa
ret

spaces db "                                                                                                                                                              ",0

