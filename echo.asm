;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ax -> point to array
 ;;to show what is seved in array

echo: 
 mov si, sign
 call printString
 mov si,ax
  add si,5
 call printString
 mov si,enterTemp
 call printString
 
                   
ret
        
        sign db '>>> ',0
        enterTemp db 0ah,0dh,0
        
