%include'io.inc'
CEXTERN malloc

addhead_fastcall:
	PUSH EBP
	MOV EBP, ESP
	PUSH ECX
	PUSH 8
	CALL malloc
	ADD ESP, 4
	POP ECX
	TEST EAX, EAX
	CMOVZ EAX, ECX
	JZ .L1
	MOVSX DWORD [EAX], DX
	MOV DWORD [EAX + 4], ECX
.L1:
	POP EBP
	RET
	
