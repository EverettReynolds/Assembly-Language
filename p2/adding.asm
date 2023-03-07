; Everett Reynolds
; Adding Integers
; 9-14-20
; An Assembly Adding Project I Guess

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

	mov AX, 0CDBAh
	mov BX, 0CDBAh
	add AX, BX
	mov AX, 0ABCDh
	mov BX, 0ABCDh
	add AX, BX
	mov AX, 0FAFAh
	mov BX, 0505h
	add AX, BX
	mov AX, 0F0F0h
	mov BX, 0FF00h
	add AX, BX
	mov AX, 0D468h
	mov BX, 2B98h
	add AX, BX
	mov AX, 700Fh
	mov BX, 0FF1h
	add AX, BX
	mov AX, 1234h
	mov BX, 7654h
	add AX, BX
	mov AX, 0B0Bh
	mov BX, 0A11Eh
	add AX, BX
	mov AX, 7654h
	mov BX, 789Ah
	add AX, BX
	mov AX, 8000h
	mov BX, 8000h
	add AX, BX



; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
