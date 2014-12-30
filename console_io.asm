; Console input and output procedures
; This porcedure displays null terminated string
; arguments: si -> Address of null terminated string
; returns: N/A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;return:not
;;recieved: si-> point to array
;;pre condition:not
;;print string that its address is in si
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printString:

    pusha
    mov ah, 0Eh
.loop1:
    lodsb
    cmp al, 0
    je .return
    cmp al, '\'
    jne .down
    lodsb
    cmp al,'t'
    je .printTab
    cmp al,'n'
    je .printEnter
    mov al,'\'
    int 10h
    dec si
    lodsb
    jmp .down
    
    .printTab:
        mov al,' '
        int 10h
        mov al,' '
        int 10h
        mov al,' '
        int 10h
        mov al,' '
        int 10h
        jmp .loop1
        
     .printEnter:
     push si
     mov si,enterStr
     call printString
     pop si
     jmp .loop1
    
    .down:
    int 10h
    jmp .loop1
.return:
    popa
    
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;return:not
;;recieved: buffer
;;pre condition:not
;;print char that is in buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printChar:
        pusha
        mov si , buffer
        mov ah,0Eh
        lodsb
        int 10h
        popa
        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;return:not
;;recieved: di-bx-> point to array
;;pre condition:
;;get stirng and show it on screen untill enter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getString:
        pusha
        mov ax,0
        mov si, buffer
       ; mov di,0
        
        l1:
        mov ah,10h
        int 16h
          
        cmp al,8
        jne .here
       mov byte[di],0
        dec di
       
        int 10h
        mov al," "
        int 10h
        mov al,8
        int 10
        mov byte[buffer] , al
        call printChar
        jmp l1
        
        .here:
       cmp al,13
        je printStr
        
        mov byte[buffer] , al
        mov byte[di],al
        
        call printChar
        inc di
        jmp l1
                    

        printStr:
         
        ;mov byte[di] ,0DH
        ;inc di
        ;mov byte[di] ,0Ah
        ;inc di
        mov byte[di] ,0         ; bayad bashe bara moghayese
        
        mov byte[buffer],0dh
        call printChar
        mov byte[buffer],0ah
        call printChar
        
        ;to show what is seved in array
        ;mov si,sign
        ;call printString   
        ;mov si, bx
        ;call printString   
;---------------------------------------------------------------------
        mov byte[buffer],0dh
        call printChar
        mov byte[buffer],0ah
        call printChar
        popa
        ret
         
        
;sign db '>>> ',0
buffer db 0
enterStr db 0ah,0dh,0
; Write the rest of functions you need for console_io here
; you may also create other ".asm" files for rest of functions you need
; just do NOT forget to include them in "kernel.asm"
