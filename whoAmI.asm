who:
        mov si,sign
        call printString
        mov si,user_temp
        call printString
        mov si,tab
        call printString
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;add date
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
        mov ax , 0		
	call getTime
ret        

tab db "                    ",0
