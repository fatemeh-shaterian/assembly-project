who:
        mov si,sign
        call printString
        mov si,user_temp
        call printString
        mov byte[buffer],0dh
        call printChar
        mov byte[buffer],0ah
        call printChar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 	mov si,sign
        call printString
        mov si , dat
        call printString
	 mov si,tab
        call printString
        call getDate
        mov si , sign
        call printString
        mov si , tim
        call printString
         mov si,tab
        call printString
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
        mov ax , 0		
	call getTime
ret        

tab db "                 ",0
dat db "current date :" , 0
tim db "current time :" , 0
