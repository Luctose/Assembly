TITLE

; Name: 
; Date: 
; ID: 
; Description: 

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two files are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here
	val3 byte "Hello Word", 0

.code
main PROC
	
	; code goes here
	mov edx, offset val3
	call WriteString
	call crlf
	call DumpRegs ; displays registers in console

	exit

main ENDP
END main
