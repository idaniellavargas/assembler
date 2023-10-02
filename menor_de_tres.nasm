JMP start

na: DB 5
nb: DB 10
nc: DB 2  
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

copyC:
	MOV A, C
	CALL end


menorA:
	CMP A, C
	JAE copyC
	CALL end

menorB:
	MOV A, B
	CMP B, C
	JAE copyC
	CALL end


start:
	MOV D, 232
	MOV A, [na]
	MOV B, [nb]
	MOV C, [nc]
	CMP A, B
	JBE menorA
	JA menorB ; jump if above

end:
	CMP A,9
	JNBE .2digitos
	JNZ .1digito
