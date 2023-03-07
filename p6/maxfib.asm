; Everett Reynolds
; Program 6: Max Fibonacci
; 10-18-20
; The maximum fibonacci number that can be held within a double word

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
nums:   dd      0,1
count:  dd      4
SECTION .bss
; define uninitialized data here:
MaxFib:  RESD 1

SECTION .text
global _main
_main:

; put your code here.

xor eax,eax
xor ebx,ebx
mov eax,0
mov ebx,1

whileNotMax:

	mov edx,eax
	add edx,ebx
	jc endWhile

	mov eax,ebx
	mov ebx,edx
	jmp whileNotMax

endWhile:

	mov [MaxFib],ebx
lastBreak:

; Normal Termination Code

mov eax, 1
mov ebx, 0
int 80h

