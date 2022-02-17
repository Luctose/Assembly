TITLE Program Random

; Name: Lucas Sarweh
; Date: February 9th 2022
; ID: 110042658
; Description: Random number tells how many numbers to get from standard input

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two files are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here
	;randNum DWORD ?

.code

main PROC
	
	; code goes here
    call Randomize ; Randomize the seed
    move eax, #4 ; Set eax to 4 to allow 4 digits 0 - 3
	call RandomRange ; Perform the number generation
    add eax, #2 ; Add 2 to the register to make it 2 - 5
	call DumpRegs ; displays registers in console

	exit

main ENDP
END main
