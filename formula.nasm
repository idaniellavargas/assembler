JMP start

seis: DB 6
cinco: DB 5
veinte: DB 20
diez: DB 10
siete: DB 7
cero: DB 0

start:
	MOV A, [seis]
	MOV B, [cinco]
	MUL B
	PUSH A

	MOV A, [veinte]
	MOV B, [diez]
	SUB A, B
	PUSH A

	MOV A, [diez]
	MOV B, [cinco]
	SUB A, B
	MOV C, A

	MOV A, [cero]
	POP B
	ADD A, B
	POP B
	ADD A, B
	SUB A, C

	DIV [siete]
	MOV D, 232
	ADD A, 48
	MOV [D], A

	HLT
