
;; return di point at the end
;;resived si
;; use: bx,dx

tabFunc:

        mov bx,array
        mov dx,time
        call halfCmp
        cmp bx,1
        je .toTime
        
        mov bx,array
        mov dx,shutDown
        call halfCmp
        cmp bx,1
        je .toShutDown
        
        mov bx,array
        mov dx,echoT
        call halfCmp
        cmp bx,1
        je .toEcho
        
        mov bx,array
        mov dx,clearT
        call halfCmp
        cmp bx,1
        je .toClear
        
        mov bx,array
        mov dx,reset
        call halfCmp
        cmp bx,1
        je .toReset
        
        mov bx,array
        mov dx,helpT0
        call halfCmp
        cmp bx,1
        je .toHelp
        
        
        
        jmp .toNot
        
        .toTime:
        mov dx,time
        mov bx,array
         jmp .top
        
        
        .toShutDown:
         mov dx,shutDown
        mov bx,array
        jmp .top
        
        .toEcho:
        mov dx,echoT
        mov bx,array
        jmp .top
        
        .toClear:
        mov dx,clearT
        mov bx,array
        jmp .top
        
        .toReset:
        mov dx,reset
        mov bx,array
        jmp .top
        
        .toHelp:
        mov dx,helpT0
        mov bx,array
        jmp .top

        .top:
        push bx
        mov bx,dx
        mov al,byte[bx+si]
        cmp al,0
        je .toEnd
        pop bx
        mov byte[buffer] , al
        mov byte[bx+si],al
        call printChar        
        inc si
        jmp .top
        
       
        .toEnd:
        
        ;mov si,array
        ;call printString
        pop bx
        add si,bx
        mov di,si
        ;mov si,array
        ;call printString
        
        .toNot:
ret

;time db "time",0
;shutDown db "shutdown",0
;echoT db "echo",0
;clearT db "clear",0
;reset db "reset",0
;helpT0 db "help",0
;helpT1 db "help",0
;whoT db "who am i",0
;comNotFound db "command not found...",0dh,0ah,0
;timess db "time -s",0     
