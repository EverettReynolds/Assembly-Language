; Everett Reynolds
; Program 4: Fibonacci Sequence
; 10-1-20
; Some weird math mumbo jumbo that we gotta figure out. His name was Fibonacci but I'm not sure.

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
nums:   dd      0,1

SECTION .bss
; define uninitialized data here
Fibs: RESD 16

SECTION .text
global _main
_main:

; put your code here.

xor eax,eax
mov DWORD[Fibs],eax
add eax,1
mov DWORD[Fibs+4],eax
mov DWORD[Fibs+8],eax
add eax, DWORD[Fibs+8]
mov DWORD[Fibs+12],eax

add eax, DWORD[Fibs+12]
sub eax, DWORD[Fibs+4]
mov DWORD[Fibs+16], eax

add eax, DWORD[Fibs+16]
sub eax, DWORD[Fibs+8]
mov DWORD[Fibs+20], eax

add eax, DWORD[Fibs+20]
sub eax, DWORD[Fibs+12]
mov DWORD[Fibs+24], eax

add eax, DWORD[Fibs+24]
sub eax, DWORD[Fibs+16]
mov DWORD[Fibs+28], eax

add eax, DWORD[Fibs+28]
sub eax, DWORD[Fibs+20]
mov DWORD[Fibs+32], eax

add eax, DWORD[Fibs+32]
sub eax, DWORD[Fibs+24]
mov DWORD[Fibs+36], eax

add eax, DWORD[Fibs+36]
sub eax, DWORD[Fibs+28]
mov DWORD[Fibs+40], eax

add eax, DWORD[Fibs+40]
sub eax, DWORD[Fibs+32]
mov DWORD[Fibs+44], eax

add eax, DWORD[Fibs+44]
sub eax, DWORD[Fibs+36]
mov DWORD[Fibs+48], eax

add eax, DWORD[Fibs+48]
sub eax, DWORD[Fibs+40]
mov DWORD[Fibs+52], eax

add eax, DWORD[Fibs+52]
sub eax, DWORD[Fibs+44]
mov DWORD[Fibs+56], eax

add eax, DWORD[Fibs+56]
sub eax, DWORD[Fibs+48]
mov DWORD[Fibs+60], eax

add eax, DWORD[Fibs+60]
sub eax, DWORD[Fibs+52]
mov DWORD[Fibs+64], eax















        
done:

; Normal termination code
        mov eax, 1
        mov ebx, 0
        int 80h

