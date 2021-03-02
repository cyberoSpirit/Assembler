INCLUDE LIBMACRO.INC
PROGRAM SLOVO
.CONST
VR DB 'VVEDIT RYADOK KINETS-.',0
VZ DB 'VVEDENNIA ZAVERSHEMO',0
VD DB 'DOVZHUNA RYADKA DO KRAPKU=',0
.DATA
MAS1 DB 100 DUP(' '),0
MAS2 DB 50 DUP(' ')
MAS3 DB 50 DUP(?)
K DW 0
M Db 0
t dw 0
D DB 0

START
MOV AX,03
INT 10H


WLINEZ VR
LINEFEED  
RLINEZ MAS1

LINEFEED
CLD           ;OBROBKA -->
LEA DI,MAS1
MOV CX,0
MOV AL,'.'
M1:
 SCASB        ;PORIVNYANNIA
 JE ENDM1
 INC CX
 JMP M1
ENDM1:
WLINEZ VD
WWORDLN CX    ;VYVODUMO KILKIST SYMVOLIV
MOV K,CX
;______________________________________________________________________________
MOV CX,K
MOV BX,0
MOV SI,0
MOV AL,' '
CLD
LEA DI,MAS1   ;ZAVANTAZH MAS1 V DI
CKL1:
 SCASB
 JNE ENCK
 MOV DH,M
 MOV MAS3[SI],DH
 ;WWORD MAS3[SI]
 INC SI
 INC T 
ENCK:
 INC M
 
LOOP CKL1     ;POSHYK PORIADKOVOGO NOMERA OSTANNIOGO SUMVOLY ' '
;_________________________________________________________________________
MOV CX,T
INC CX
MOV BX,CX
DEC BX
mov dl,m
mov mas3[bx],dl
mov Di,0
ckml2:

lea si ,mas1

mov bl,mas3[di]
;wwordln mas3[di]
;inc bl
dec bl
;wword bl
mov al,bl
cwd
;wword ax
mov bx,ax
;wword bx
add si,bx

push di
push si
pop di
push ax
mov al,' '
 SCASB
JE ENCK1
dec di
mov al,'.'
scasb
je enck1


LODSB

wchar
ENCK1:
pop ax
pop di
add di,1
LOOP CKML2 


PAUSE
RETURN
END SLOVO