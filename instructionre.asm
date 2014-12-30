;==============
;recieved : bx = point to input string
;==============
recognize:
	pusha
	push bx
	mov dx , time
	mov cx,1
	call strCmp
	cmp bx , 1
	je .toTime
	pop bx

	push bx
	mov dx , shutDown
	mov cx,1
	call strCmp
	cmp bx , 1
	je .toShutDown
	pop bx

	push bx
	mov dx , echoT
	mov cx,0
	call strCmp
	cmp bx , 1
	je .toEcho
	pop bx
	
	push bx
	mov dx , clearT
	mov cx,1
	call strCmp
	cmp bx , 1
	je .toClear
	pop bx
	
	push bx
	mov dx , reset
	mov cx,1
	call strCmp
	cmp bx , 1
	je .toReset
	pop bx
	
	push bx
	mov dx , helpT0
	mov cx,1
	call strCmp
	cmp bx , 1
	je .tohelp0
	pop bx
	
	push bx
	mov dx , helpT1
	mov cx,0
	call strCmp
	cmp bx , 1
	je .tohelp1
	pop bx
	
	push bx			;;;;;;;;;;;;;;;;;;
	mov dx , timess
	mov cx,1
	call strCmp
	cmp bx , 1
	je .totimes
	pop bx			;;;;;;;;;;;;;;
	
        mov si,sign
        call printString
        mov si,comNotFound
        call printString
	jmp .end
	
	.toShutDown:
		call shutdown
		pop bx
		jmp .end
		
	.toEcho:
                
                mov ax,array
                call echo
                pop bx
	        jmp .end
	        
	  .toClear:
	        call clear
	        pop bx
	        jmp .end
	        
	    .toReset:
	    mov byte[flag],2
	    call clear
	    call enter_user
	    call clear
	    pop bx
	    jmp .end
	    
	    .tohelp0:
	    call help0
	    pop bx
	    jmp .end
	    
	    .tohelp1:
	    pop bx
	    call help1
	     jmp .end
	     
	     .totimes:	;;;
		mov ax , 1
		call getTime
		pop bx
		jmp .end
		
		.toTime:
		mov ax , 0		;;;
		call getTime
		pop bx
		jmp .end
        
	.end:
	popa
ret
time db "time",0
shutDown db "shutdown",0
echoT db "echo",0
clearT db "clear",0
reset db "reset",0
helpT0 db "help",0
helpT1 db "help",0
comNotFound db "command not found...",0dh,0ah,0
timess db "time -s",0                   ;;
