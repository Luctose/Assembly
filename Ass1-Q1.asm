TITLE Program Assignment1-Q1

; Name: Lucas Sarweh
; Date: February 12 2022
; ID: 110042658
; Description: Assignment 1 Question 1 COMP-2660

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two files are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here
	prompt1 BYTE "What is the value of C? ", 0 ; Prompt for C
	prompt2 BYTE "What is the value of D? ", 0 ; Prompt for D
	string BYTE "Z = (A - B) - (C - D)", 0 ; String of the expression
	string2 BYTE "   ;   ", 0 ; String to seperate values

	A SDWORD -543210
    B SWORD -3210

.data?
	; Uninitialized declarations
	myC SDWORD ?
    D SBYTE ?
	Z SDWORD ?

.code
main PROC
	
	; code goes here
	mov edx, offset prompt1 ; edx stores the offset of the string to write
	call WriteString ; Write the string from the offset in edx
	call ReadInt ; Read in an int
	mov myC, eax ; Move the read value from ax (eax so they are both 4 bytes)
	call WriteInt ; Write the eax we read in to the console
	call crlf ; Write end of line for next Var D

	mov edx, offset prompt2 ; Give offset of next prompt to edx
	call WriteString ; Write the string to screen
	call ReadInt ; Read an int into eax
	mov D, al ; use al low bit to transfer into D for matching type
	call WriteInt ; Write int we read in to console
	call crlf ; Write newline

	mov edx, offset string ; Set edx to wanted string
	call WriteString ; print string to screen
	call crlf ; Write newline

	mov edx, offset string2 ; move number seperator to prep writing
	mov eax, A ; Move A into register to display it
	call WriteInt ; Write current value
	call WriteString ; Seperator
	movsx eax, B ; Move B into register to display it
	call WriteInt ; Write current value
	call WriteString ; Seperator
	mov eax, myC ; Move C into register to display it
	call WriteInt ; Write current value
	call WriteString ; Seperator
	movsx eax, D ; Move D into register to display it
	call WriteInt ; Write current value
	call crlf ; Write newline
	call crlf

	mov ebx, myC ; eax <-- C
	movsx ecx, D ; ecx <-- D
	sub ebx, ecx ; C - D
	mov eax, A ; ebx <-- A
	movsx ecx, B ; ecx <-- B
	sub eax, ecx ; A - B
	sub eax, ebx ; (A - B) - (C - D)
	mov Z, eax ; Z <-- result
	call WriteBin ; Binary
	call crlf ; newline
	call WriteInt ; Signed integer
	call crlf ; newline
	call WriteHex ; Hexadecimal
	call crlf ; newline
	
	call DumpRegs ; displays registers in console

	exit

main ENDP
END main
