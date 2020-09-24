%include'io.inc'

CEXTERN printf

section .rodata
	.LC0: db "%hd", 10, 0

printlist_fastcall:
	PUSH EBP
	MOV EBP, ESP
	TEST ECX, ECX
	JZ .L1
	SUB ESP, 12
	PUSH ECX
	PUSH WORD [ECX]
	PUSH .LC0
	CALL printf
	ADD ESP, 8
	POP ECX
	ADD ESP, 12
	MOV ECX, DWORD [ECX + 4]
	SUB ESP, 8
	CALL printlist_fastcall
	ADD ESP, 8
.L1:
	POP EBP
	RET
