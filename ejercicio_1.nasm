JMP start

n1: DB 12
n2: DB 4
multi: DB 0
divi: DB 0
suma: DB 0
resta: DB 0
coma: DB 44
ascii: DB 48
esp:  DB 32

msg: DB "Nop" ; Variable
       DB 0	; String terminator

error:
	MOV C, msg     
	MOV D, 232	
	CALL exception
        HLT             

exception:
	PUSH A
	PUSH B
	MOV B, 0
.loop:
	MOV A, [C]	; Get char from var 1 byte ascii extraer
	MOV [D], A	; imprimir
	INC C           ; siguiente char
	INC D           ; siguiente celda del output
	CMP B, [C]	; Check if end string terminated?
	JNZ .loop	; jump if not

	POP B
	POP A
	RET

flujo:
	MOV A, [suma] ;suma
	CALL a_sumar

	MOV A, [resta]
	CALL a_restar

	MOV A,[multi]
	CALL a_multiplicar
	MOV A, [divi]
	CALL a_dividir
	DEC D
	MOV C, [esp]
	MOV [D], C	; Escribe en Output
	HLT

a_sumar:
	MOV D, 232
        CMP A,9
	JNBE .2digitos
	JNZ .1digito

a_restar:
	MOV A, [resta]
        CMP A,9
	JNBE .2digitos
	JNZ .1digito

a_multiplicar:
	MOV A,[multi]
        CMP A,9
	JNBE .2digitos
	JNZ .1digito

a_dividir:
	MOV A,[divi]
        CMP A,9
	JNBE .2digitos
	JNZ .1digito


.1digito:
	ADD A, [ascii] ; Convierte a ascii (Sumando ascii de cero)
	MOV [D], A	; Escribe en Output
	INC D
	MOV C, [coma]
	MOV [D], C	; Escribe en Output
	INC D
	RET

.2digitos:
	MOV B, A	
	DIV 10		; División entera
	MOV C, A	; 1
	MUL 10		; 10	
	SUB B, A	; 16 - 10 = 6
	ADD B, [ascii] ; Convierte a ascii (Sumando ascii de cero)
	ADD C, [ascii] ; Convierte a ascii (Sumando ascii de cero)
	MOV [D], C	; Escribe en Output
	INC D		; Incrementa en 1 la celda de memoria
	MOV [D], B	; Escribe en Output
	INC D
	MOV C, [coma]
	MOV [D], C	; Escribe en Output
	INC D
	RET


start:
	MOV A, [n1]
	MOV B, [n2]
	CMP B, 0
	JE error
       
  ADD A, B
  MOV [suma], A
	MOV A, [n1]
	SUB A, B
  MOV [resta], A
	MOV A, [n1]
	MUL [n2]
  MOV [multi], A
	MOV A, [n1]
	DIV B
  MOV [divi], A
	CALL flujo
