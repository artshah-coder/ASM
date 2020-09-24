%include'io.inc'

CEXTERN printf

section .rodata
	.LC0: db "%hd", 10, 0

printlist_cdecl:
	PUSH EBP
	MOV EBP, ESP
	PUSH EBX
	MOV EBX, DWORD [EBP + 8]
.L2:
	TEST EBX, EBX
	JZ .L1
	PUSH WORD [EBX]
	PUSH .LC0
	CALL printf
	ADD ESP, 8
	MOV EBX, DWORD [EBX + 4]
	JMP .L2
.L1:
	POP EBX
	POP EBP
	RET
