INCLUDE LIBMACRO.INC
PROGRAM PRAC2
;Practuchna 2 Variant 19(2)
;Dano chusla x, y, z. Obchuslutu znachennia vurazy: u=max(x,y,z)^2-x^2min(x,y,z.)
.DATA
VX DB 'VVEDIT X=',0
VY DB 'VVEDIT Y=',0
VZ DB 'VVEDIT Z=',0
VR DB 'U=',0
X DB ?
Y DB ?
Z DB ?
START
WLINEZ VX
RWORD AL
MOV X,AL

;WWORD X

WLINEZ VY
RWORD AL
MOV Y,AL
WLINEZ VZ
RWORD AL
MOV Z,AL



MOV AL,X
CMP AL,Y
       JL KOLU_XM
MOV AL,Y
CMP AL,Z   ;X>Y
       JL KOLU_YM
MOV AL,Z
IMUL X
IMUL X
      ;X^2*Z
       JMP P
        
KOLU_YM:MOV AL,Y
       IMUL X
       IMUL X
           ;X^2*Y
       JMP P

KOLU_XM::MOV AL,X
       IMUL X
       IMUL X      ;X^2*X
      
       

P:;  WWORD AX
    MOV BX,AX

MOV AL,X
CMP AL,Y
JGE KOLU_XB
MOV AL,Y
CMP AL,Z   ;X<Y
JG KOLU_YB
MOV AL,Z
IMUL Z      ;Z^2
JMP RISN
KOLU_YB:MOV AL,Y
       IMUL Y      ;Y^2
       JMP RISN

KOLU_XB::MOV AL,X
       IMUL X     ;X^2
       ;WWORD X
       JMP RISN
     
       
RISN: ; WWORD AX
       SUB AX,BX

      WLINEZ VR
      WWORD AX
      
      MOV AH,06H
      INT 10H
      PAUSE
      RETURN
      END PRAC2




