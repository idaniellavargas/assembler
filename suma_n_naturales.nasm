JMP start

na: DB 5  
nb: DB 10  
ascii: DB 48
suma: DB 0

.1digito:
	ADD A, [ascii] 
	MOV [D], A	
	INC D
	HLT

.2digitos:
	MOV B, [suma]	
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
	HLT

start:
	MOV D, 232
	MOV A, [na]
	MOV B, [nb]
	ADD B, 1
	MOV [nb], B
	CALL loop

end:
	MOV A,[suma]
	CMP A,9
	JNBE .2digitos
	JNZ .1digito
	

loop:
	MOV [suma],A
	MOV A,[na]
	ADD A,1
	MOV [na],A
	ADD A, [suma]
	MOV B,[na]
	CMP B,[nb]
	JNE loop
	JE end
