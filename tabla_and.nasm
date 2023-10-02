JMP start

zero: DB 0
uno: DB 1

start:
	; Primer resultado: A=0, B=0
	MOV A, [zero]
	MOV B, [zero]
	AND A, B

	; Segundo resultado: A=0, B=1
	MOV A, [zero]
	MOV B, [uno]
	AND A, B
	
	; Tercer resultado: A=1, B=0
	MOV A, [uno]
	MOV B, [zero]
	AND A, B
	
	; Cuarto resultado: A=1, B=1
	MOV A, [uno]
	MOV B, [uno]
	AND A, B
	
	; Terminar el programa
	HLT
