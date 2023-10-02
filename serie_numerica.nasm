JMP start

n: DB 1  
coma: DB 44
cont: DB 0
ascii: DB 48
esp:  DB 32

.1digito:
	ADD A, [ascii] 
	MOV [D], A	
	INC D
	MOV C, [coma]
	MOV [D], C	
	INC D
	JMP loop

.2digitos:
	MOV B, A	
	DIV 10		
	MOV C, A	
	MUL 10		
	SUB B, A	
	ADD B, [ascii] 
	ADD C, [ascii] 
	MOV [D], C	
	INC D		
	MOV [D], B	
	INC D
	MOV C, [coma]
	MOV [D], C	
	INC D
	JMP loop
end:
	DEC D
	MOV C, [esp]
	MOV [D], C	
	HLT

start:
	MOV D, 232
	MOV A, [n]
	ADD A,[ascii]
	MOV [D], A
	MOV A, [n]
	INC D
	MOV C, [coma]
	MOV [D], C	; Escribe en Output
	INC D
	CALL loop

loop:
	MOV B, [cont]
	ADD B,1
	MOV [cont], B
	CMP B,8
	JE end
	MOV A, [n]
	ADD A,B
	MOV [n],A
  CMP A,9
	JNBE .2digitos
	JNZ .1digito
