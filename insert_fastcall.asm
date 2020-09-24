%include'io.inc'

CEXTERN malloc

insert_fastcall:
	PUSH EBP
	MOV EBP, ESP
	PUSH ESI
	
	MOV ESI, ECX
	TEST ECX, ECX
	JNE .L1
	PUSH DX
	SUB ESP, 12
	PUSH 12
	CALL malloc
	ADD ESP, 16
	POP DX
	TEST EAX, EAX
	JE .L3
	MOVSX DWORD [EAX], DX
	MOV DWORD [EAX + 4], 0
	MOV DWORD [EAX + 8], 0
	JMP .L3
.L1:
	CMP WORD [ECX], DX
	JE .L2
	JG .L4
	CMP DWORD [ECX + 8], 0
	JE .L5
	SUB ESP, 4
	MOV ECX, [ECX + 8]
	CALL insert_fastcall
	ADD ESP, 4
	JMP .L2
.L5:
	PUSH ECX
	PUSH DX
	SUB ESP, 8
	PUSH 12
	CALL malloc
	ADD ESP, 12
	POP DX
	POP ECX
	TEST EAX, EAX
	JE .L2
	MOV DWORD [ECX + 8], EAX
	MOVSX DWORD [EAX], DX
	MOV DWORD [EAX + 4], 0
	MOV DWORD [EAX + 8], 0
	JMP .L2
.L4:
	CMP DWORD [ECX + 4], 0
	JE .L6
	SUB ESP, 4
	MOV ECX, DWORD [ECX + 4]
	CALL insert_fastcall
	ADD ESP, 4
	JMP .L2
.L6:
	PUSH ECX
	PUSH DX
	SUB ESP, 8
	PUSH 12
	CALL malloc
	ADD ESP, 12
	POP DX
	POP ECX
	TEST EAX, EAX
	JE .L2
	MOV DWORD [ECX + 4], EAX
	MOVSX DWORD [EAX], DX
        MOV DWORD [EAX + 4], 0
        MOV DWORD [EAX + 8], 0
.L2:
	MOV EAX, ESI
.L3:
	POP ESI
	POP EBP
	RET
