; Everett Reynolds
; P9 - Sort
; 11-10-20
; We happen to be sorting an array in increasing order

%macro printA 2
 	mov eax,4
        mov ebx,1
        mov ecx,%1
        mov edx,%2
        int 80h
%endmacro

%macro printP 2
 	mov eax,4
        mov ebx,1
        mov ecx,%1
        mov edx,%2
        int 80h

%endmacro

%macro  callitoa 2
        pusha
        mov     ax,%1
        mov     ebx,%2
        call    _itoa
        popa
%endmacro


SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
nums:	db	100, 200, 5, 10, 0, 88, 22
numslen:	EQU	($-nums)
cls     db      1bh, '[2J'
clsLen  EQU     $-cls
output: db "  ",10
hundred: db 100
ten: db 10
originHead: db	"Original Array",10
originLen  EQU     $-originHead
sortHead:   db  "Sorted Array",10
sortLen  EQU     $-sortHead
clr             db 1bh,'[2J'


SECTION .bss
; define uninitialized data here


SECTION .text
global _main,_itoa,_convert,_sort
_main:
; put your code here.

	mov     eax,4
        mov     ebx,1
        mov     ecx,clr
        mov     edx,4
        int     80h

	printP originHead, originLen
	printA nums,numslen
	call _sort
	printP sortHead, sortLen
        printA nums,numslen
        call _sort


lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h


_itoa:
        pusha
        mov     cl,10
        div     cl
        add     ah,'0'
        add     al,'0'
        mov     [ebx],ax
        popa
        ret

_convert:
        pusha

        mov ebx,output
        xor ah,ah
        div BYTE[hundred]
        add al, '0'
        mov [ebx],al
        inc ebx
        shr ax,8
        div BYTE[ten]
        add al,'0'
        mov [ebx],al
        add ah, '0'
        inc ebx
        mov [ebx],ah


        popa
        ret
_sort:
	pusha



	popa
	ret
