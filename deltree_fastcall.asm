%include'io.inc'

CEXTERN free

deltree_fastcall:
	PUSH EBP
	MOV EBP, ESP
	PUSH ESI
	PUSH EDI
	TEST ECX, ECX
	JE .L1
	MOV ESI, DWORD [ECX + 4]
	MOV EDI, DWORD [ECX + 8]
	SUB ESP, 12
	PUSH ECX
	CALL free
	ADD ESP, 16
	MOV ECX, EDI
	CALL deltree_fastcall
	MOV ECX, ESI
	CALL deltree_fastcall
.L1:
	POP EDI
	POP ESI
	POP EBP
	RET
