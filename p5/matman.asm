; Everett Reynolds
; Matrix Manipulation
; 10-7-20
; Summing up all these numbers with nested for loops for some reason

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
ROWS:		EQU	5	; defines a constant ROWS set to 3.
COLS:           EQU	7	; defines a constant COLS set to 2.

MyMatrix: 	dd	 1,  2,  3,  4,  5,  6,  7
	    	dd	 8,  9, 10, 11, 12, 13, 14
		dd	15, 16, 17, 18, 19, 20, 21
		dd	22, 23, 24, 25, 26, 27, 28
		dd	29, 30, 31, 32, 33, 34, 35




SECTION .bss
; define uninitialized data here
RowSums: 	RESD ROWS
ColSums:	RESD COLS
Sum:		RESD 1
GrandTotal: 	RESD 1
saveECX: 	RESD 1
SECTION .text
global _main
_main:

; put your code here.

	xor eax,eax
	mov ebx, MyMatrix
	mov ecx,COLS
rowSumOutter:
	mov[saveECX],ecx
	mov ecx, ROWS
rowSumInner:
	
	add	eax,DWORD[ebx]
	add     ebx,4
	loop 	rowSumInner

	mov ecx,[saveECX]
	loop rowSumOutter
	
	mov [RowSums],eax




        xor eax,eax
        mov ebx, MyMatrix
        mov ecx,ROWS
colSumOutter:
        mov[saveECX],ecx
        mov ecx, COLS
colSumInner:

        add     eax,DWORD[ebx]
        add     ebx,4
        loop    colSumInner

        mov ecx,[saveECX]
        loop colSumOutter

        mov [ColSums],eax


	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	xor edx,edx
		
	mov ecx, ROWS
	mov DWORD[GrandTotal],0
	mov ebx, MyMatrix
outtertotal:
	mov [saveECX],ecx
	mov ecx,COLS
innertotal:
	add eax,DWORD[ebx]
	add ebx,4
	loop innertotal
	mov ecx, [saveECX]
	mov edx,eax
	loop outtertotal
	
	
	mov[GrandTotal],edx

lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

