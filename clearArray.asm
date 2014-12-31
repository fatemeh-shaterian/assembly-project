clearArray:
pusha
mov cx,100
mov si,array

.l1:
mov byte[si],0
inc si
loop .l1
popa
ret
