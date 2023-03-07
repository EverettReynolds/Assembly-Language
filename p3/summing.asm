; Everett Reynolds
; Summing Arrays
; 9-26-2020
; Add Those Arrays together into sum variables botta bip botta boop

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
bArray:		DB	-1,2,-3,4,-5,6
wArray:		DW	09h,0ah,0bh,0ch,0dh
dArray:		DD	-10,-20,-30,-40,-50
bArraySum: 	DB 	0
wArraySum:	DW 	0
dArraySum:	DD 	0
grandTotal: 	DD      0

SECTION .bss
; define uninitialized data here


SECTION .text
global _main
_main:
; put your code here.
mov al, [bArray]
add al, [bArray +1]
add al, [bArray +2]
add al, [bArray +3]
add al, [bArray +4]
add al, [bArray +5]
mov [grandTotal], al
xor al,al

mov ax, [wArray]
add ax, [wArray +2]
add ax, [wArray +4]
add ax, [wArray +6]
add ax, [wArray +8]
add [grandTotal], ax
xor ax,ax

mov eax, [dArray]
add eax, [dArray +4]
add eax, [dArray +8]
add eax, [dArray +12]
add eax, [dArray +16]
add [grandTotal], eax
xor eax,eax





lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

