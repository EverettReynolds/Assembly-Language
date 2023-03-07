; Everett Reynolds
; P8: Bounce
; 11-7-20
; Graphical Infinite Bouncing on Screens





%macro  Print 2
        pusha
	mov ebx,%1
	mov ecx,%2
	push ebx
	push ecx
        mov eax,4
	mov ecx,ebx
        mov ebx,1
	mov edx,%2
        int 80h
        popa
%endmacro

%macro  setCursor 2
        pusha
        mov     ah,%1
        mov     al,%2
        call    _cursor
        popa
%endmacro



SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
message:	db	" "  ;;; one space
		db	"Everyday I Wake Up. *Cries* "
		db	" "  ;;; one more space
cls:		db 	1bh,'[2J'
clsLen 	        dd      $-cls
pos:		db	1bh, '['
row:		db	'00'
		db      ';'
col:		db 	'00'
		db	'H'
msglen:	EQU	($-message)
currentColumn:	db 	0

maximumColumn: 	db 	79-msglen
 

SECTION .bss
; define uninitialized data here

SECTION .text
global _main,_clrscr,_forward,_backward,_sleep,_cursor
_main:

; put your code here.

call _clrscr
break1:
setCursor 10, [currentColumn]
break2:
Print message, msglen
break3:

infinite:
	call _forward
	
	call _backward
	break4:
	jmp infinite
	


; Normal termination code
mov eax, 1
mov ebx, 0
int 80h


_forward:
	 pusha
        inc BYTE[currentColumn]
        mov ah,[maximumColumn]
        cmp [currentColumn],ah
        jge skip1
        call _sleep
skip1:
        setCursor 10, [currentColumn]
        Print message, msglen
        popa
        jmp _forward


_backward:
        pusha
        dec BYTE[currentColumn]
        mov ah,0
        cmp [currentColumn],ah
        jle skip2
        call _sleep
skip2:
        setCursor 10, [currentColumn]
        Print message, msglen
        popa
        jmp _backward
	


_sleep:
        pusha
        mov     eax,162
        mov     ebx,sec
        mov     ecx,0
        int     80h
        popa
        ret




_cursor:
        pusha

        push    eax

        shr     ax,8    
        mov     bl,10
        div     bl      
        add     ah,'0'
        add     al,'0'
        mov     BYTE [row],al
        mov     BYTE [row+1],ah

        pop     eax     
        and     ax,0FFh 
        mov     bl,10
        div     bl      
        add     ah,'0'
        add     al,'0'
        mov     BYTE [col],al
        mov     BYTE [col+1],ah

        
        mov     eax,4
        mov     ebx,1
        mov     ecx,pos
        mov     edx,8
        int     80h

        popa
        ret

_clrscr:
	pusha
        mov     eax,4
        mov     ebx,1
        mov     ecx,cls
        mov     edx,4
        int     80h
        popa
        ret


sec: 	dd 	1,0

