TITLE Program Assignment1-Q2

; Name: Lucas Sarweh
; Date: February 12 2022
; ID: 110042658
; Description: Assignment 1 Question 2 COMP-2660

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two files are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data

    ; Data declarations
    string BYTE "h , ", 0 ; String to make output look nicer
    string2 BYTE "Enter a hexadecimal integer: ", 0 ; Prompt for number

.data?
    
    ; Uninitialized data declarations
    bigEndian BYTE 4 DUP(?)
    littleEndian DWORD ?

.code
main PROC

    ; Code goes here
    mov edx, offset string2 ; Prep prompt output
    call WriteString ; Write the prompt
    call ReadHex ; Read in a hexidecimal number into eax
    mov littleEndian, eax ; littleEndian <-- eax
    mov ecx, TYPE littleEndian ; Set loop for the bytes of the variable
    mov esi, 0 ; Set pointer offset of bigEndian variable
    mov edx, offset string ; Prep string for output

L1: mov bl, BYTE PTR [littleEndian + ecx - 1] ; Move first Byte into bl register
    mov [bigEndian + esi], bl ; bigEndian[i] <-- bl
    movzx eax, [bigEndian + esi] ; eax <-- bigEndian[i] for printing
    mov ebx, 1 ; Data for WriteHexB, print BYTE
    call WriteHexB ; print bigEndian[i] Only 1 byte
    call WriteString ; Write String for looks
    inc esi ; ++esi
    loop L1 ; Loop for each Byte in littleEndian to transfer into bigEndian

    call crlf ; newline

    call DumpRegs ; Dump registers

    exit
main ENDP
END main