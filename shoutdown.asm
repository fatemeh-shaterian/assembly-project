shoutdown:
        call clear
        mov si, m_shoutdown
        call printString
        hlt
ret
m_shoutdown db 'shouting down',0

