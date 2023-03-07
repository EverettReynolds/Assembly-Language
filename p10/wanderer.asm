; Everett Reynolds
; P10 Wanderer
; 11-16-20
; A lost character array


; Constant for Size of array of structs
LEN:    EQU     47

; Define Structure for character on screen
STRUC mStruct
                RESB 2  ; space for <esc>[
        .row:   RESB 2  ; two digit number (characters)
                RESB 1  ; space for ;
        .col:   RESB 2  ; two digit number (characters)
                RESB 1  ; space for the H
        .char:  RESB 1  ; space for THE character
        .size:
ENDSTRUC

SECTION .data
; clear screen string
clr             db 1bh,'[2J'
; Create an array of structs: formatted like the print interrupt uses.
message:        db 1bh,'[01;07H '
                db 1bh,'[01;08HG'
                db 1bh,'[01;09Ho'
                db 1bh,'[01;10H '
                db 1bh,'[01;11HB'
                db 1bh,'[01;12He'
                db 1bh,'[02;13Ha'
                db 1bh,'[02;14Hr'
                db 1bh,'[03;15Hs'
                db 1bh,'[04;16H!'
                db 1bh,'[05;17H '
                db 1bh,'[06;17H '
                db 1bh,'[07;18H '
                db 1bh,'[08;18H '
                db 1bh,'[09;18H '
                db 1bh,'[10;18H '
                db 1bh,'[11;18H '
                db 1bh,'[12;17H '
                db 1bh,'[13;17H '
                db 1bh,'[14;16H '
                db 1bh,'[15;15H '
                db 1bh,'[16;14H '
                db 1bh,'[17;13H '
                db 1bh,'[17;12H '
                db 1bh,'[18;11H '
                db 1bh,'[18;10H '
                db 1bh,'[18;09H '
                db 1bh,'[18;08H '
                db 1bh,'[18;07H '
                db 1bh,'[17;06H '
                db 1bh,'[17;05H '
                db 1bh,'[16;04H '
                db 1bh,'[15;03H '
                db 1bh,'[14;02H '
                db 1bh,'[13;02H '
                db 1bh,'[12;01H '
                db 1bh,'[11;01H '
                db 1bh,'[10;01H '
                db 1bh,'[09;01H '
                db 1bh,'[08;01H '
                db 1bh,'[07;01H '
                db 1bh,'[06;01H '
                db 1bh,'[05;02H '
                db 1bh,'[04;03H '
                db 1bh,'[03;04H '
                db 1bh,'[02;05H '
                db 1bh,'[02;06H '


SECTION .bss

SECTION .text
global _main
_main:
        mov     eax,4
        mov     ebx,1
        mov     ecx,clr
        mov     edx,4
        int     80h

top:    call    _displayMessage
        call    _pause
        call    _adjustMessage
        jmp     top


lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h


;;;;;;;;;;;;  Rotation of Characters Through Array of Structs
_adjustMessage:
        pusha

        mov     al, BYTE [message + mStruct.char] ;; get first char to put at bottom
        push    eax   ; save for bottom

        mov     ebx,message  ;; pointer into array, starting at top
        mov     ecx,LEN-1    ;; loop

_amTop: mov     dl,[ebx + mStruct.size + mStruct.char]  ;; get char below
        mov     [ebx + mStruct.char],dl                 ;; put on current row

        add     ebx,mStruct.size
        loop    _amTop

        pop     eax     ;; retreive the first char
        mov     BYTE [ebx + mStruct.char],al

        popa
        ret




;   Function to print the array of structs of message
_displayMessage:
        pusha
        mov     ebx,message
        mov     ecx,LEN

_dmTop: push    ecx
        push    ebx
        mov     eax,4  ; system print
        mov     ecx,ebx ; points to string to print
        mov     ebx,1   ; standard out
        mov     edx,9   ; num chars to print
        int     80h

        pop     ebx
        add     ebx,mStruct.size
        pop     ecx
        loop    _dmTop
        popa
        ret


;; Sleep Function
_pause:
        pusha
        mov     eax,162
        mov     ebx,seconds
        mov     ecx,0
        int     80h
        popa
        ret

seconds: dd     0,50000000  ;;;  seconds, nanoseconds

