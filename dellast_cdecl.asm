%include'io.inc'

CEXTERN free

dellast_cdecl:
	PUSH EBP
	MOV EBP, ESP
	MOV ECX, DWORD [EBP + 8]
	MOV EDX, DWORD [ECX + 4]
	TEST EDX, EDX
	JZ .L1
.L3:	
	CMP DWORD [EDX + 4], 0
	JZ .L2
	MOV ECX, DWORD [ECX + 4]
	MOV EDX, DWORD [EDX + 4]
	JMP .L3
.L2:
	MOV DWORD [ECX + 4], 0
	SUB ESP, 4
	PUSH EDX
	CALL free
	ADD ESP, 8
	JMP .L4
.L1:
	SUB ESP, 4
	PUSH ECX
	CALL free
	ADD ESP, 8
	XOR EAX, EAX
	JMP .L5
.L4:
	MOV EAX, DWORD [EBP + 8]	
.L5:
	POP EBP
	RET
