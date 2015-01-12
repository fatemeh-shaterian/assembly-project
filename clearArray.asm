;--------------------
; recieves : si = points to array we want to clean
; returns : nothing
;--------------------

clearArray:
pusha

.l1:
mov byte[si],0
inc si
cmp byte [si] , 0
je .out
loop .l1

.out:
popa
ret
