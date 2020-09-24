; функция принимает в качестве аргументов
; 2 указателя на бинарные деревья
; возвращает 1 в случае равенства деревьев
; 0 - в противном случае
; функция использует рекурсивный вызов
; реализация удовлетворяет соглашению cdecl
%include'io.inc'

eq_cdecl:
	PUSH EBP
	MOV EBP, ESP
	PUSH ESI
	PUSH EDI
	PUSH EBX
	
	XOR EAX, EAX
	MOV ECX, DWORD [EBP + 8]
	MOV EDX, DWORD [EBP + 12]
	TEST ECX, ECX
	JE .L1
	TEST EDX, EDX
	JE .L2
	JNE .L3
.L1:
	TEST EDX, EDX
	JNE .L2
	MOV EAX, 1
	JMP .L2
.L3:
	MOV SI, WORD [ECX]
	CMP SI, WORD [EDX]
	JNE .L2
	SUB ESP, 4
	MOV ESI, DWORD [ECX + 8]
	MOV EDI, DWORD [EDX + 8]
	MOV ECX, DWORD [ECX + 4]
	NOV EDX, DWORD [EDX + 4]
	PUSH EDX
	PUSH ECX
	CALL eq_cdecl
	ADD ESP, 8
	TEST EAX, EAX
	JE .L2
	MOV EBX, EAX
	PUSH EDI
	PUSH ESI
	CALL eq_cdecl
	ADD ESP, 12
	AND EAX, EBX
.L2:
	POP EBX
	POP EDI
	POP ESI
	POP EBP
	RET
