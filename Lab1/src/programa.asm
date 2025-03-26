;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"programa.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__gptrget2
	extern	__gptrput2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_esperar
	global	_lfsr_generar

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_programa_0	udata
r0x1013	res	1
r0x1014	res	1
r0x1016	res	1
r0x1015	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x100C	res	1
r0x100B	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1012	res	1
r0x1004	res	1
r0x1003	res	1
r0x1002	res	1
r0x1006	res	1
r0x1005	res	1
r0x1008	res	1
r0x1007	res	1
r0x1009	res	1
r0x100A	res	1
_main_valor_aleatorio_65536_4	res	2
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_programa	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _esperar
;   _esperar
;   _esperar
;   _esperar
;   _esperar
;   _esperar
;   _lfsr_generar
;   __moduint
;   _esperar
;   _esperar
;   _esperar
;   _esperar
;   _esperar
;   _esperar
;   _lfsr_generar
;   __moduint
;10 compiler assigned registers:
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   STK00
;   STK01
;   r0x1019
;   STK02
;; Starting pCode block
S_programa__main	code
_main:
; 2 exit points
;	.line	10; "programa.c"	unsigned short valor_aleatorio = 1;
	MOVLW	0x01
	BANKSEL	_main_valor_aleatorio_65536_4
	MOVWF	_main_valor_aleatorio_65536_4
	CLRF	(_main_valor_aleatorio_65536_4 + 1)
;	.line	12; "programa.c"	unsigned short resultado_dado = 0;
	BANKSEL	r0x1013
	CLRF	r0x1013
	CLRF	r0x1014
;	.line	13; "programa.c"	unsigned short *puntero_aleatorio = &valor_aleatorio;
	MOVLW	high (_main_valor_aleatorio_65536_4 + 0)
	MOVWF	r0x1015
	MOVLW	(_main_valor_aleatorio_65536_4 + 0)
	MOVWF	r0x1016
	CLRF	r0x1017
;	.line	15; "programa.c"	TRISIO = 0b00001000; // GPIO0, GPIO1, GPIO2 y GPIO4 como salidas; GPIO3 como entrada
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	16; "programa.c"	GPIO = 0b00000000; // Apagar todos los LEDs al inicio
	BANKSEL	_GPIO
	CLRF	_GPIO
_00117_DS_:
;	.line	20; "programa.c"	if (GP3) {
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00114_DS_
;;unsigned compare: left < lit(0x1=1), size=2
;	.line	21; "programa.c"	switch (resultado_dado) {
	MOVLW	0x00
	BANKSEL	r0x1014
	SUBWF	r0x1014,W
	BTFSS	STATUS,2
	GOTO	_00137_DS_
	MOVLW	0x01
	SUBWF	r0x1013,W
_00137_DS_:
	BTFSS	STATUS,0
	GOTO	_00117_DS_
;;genSkipc:3307: created from rifx:0x7ffc9eccb8e0
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x7=7), size=2
	MOVLW	0x00
	BANKSEL	r0x1014
	SUBWF	r0x1014,W
	BTFSS	STATUS,2
	GOTO	_00138_DS_
	MOVLW	0x07
	SUBWF	r0x1013,W
_00138_DS_:
	BTFSC	STATUS,0
	GOTO	_00117_DS_
;;genSkipc:3307: created from rifx:0x7ffc9eccb8e0
	BANKSEL	r0x1013
	DECF	r0x1013,W
	MOVWF	r0x1018
	MOVLW	HIGH(_00139_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00139_DS_
	BANKSEL	r0x1018
	ADDWF	r0x1018,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_:
	MOVWF	PCL
_00139_DS_:
	GOTO	_00110_DS_
	GOTO	_00109_DS_
	GOTO	_00108_DS_
	GOTO	_00107_DS_
	GOTO	_00106_DS_
	GOTO	_00105_DS_
_00105_DS_:
;	.line	23; "programa.c"	GPIO = 0b00001101; // GPIO0, GPIO2 y GPIO4 encendidos
	MOVLW	0x0d
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	25; "programa.c"	esperar(duracion);
	MOVLW	0xb8
	MOVWF	STK00
	MOVLW	0x0b
	PAGESEL	_esperar
	CALL	_esperar
	PAGESEL	$
;	.line	26; "programa.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	27; "programa.c"	break;
	GOTO	_00117_DS_
_00106_DS_:
;	.line	29; "programa.c"	GPIO = 0b00010101; // Pares GPIO0 y GPIO4 encendidos y central GPIO1
	MOVLW	0x15
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	31; "programa.c"	esperar(duracion);
	MOVLW	0xb8
	MOVWF	STK00
	MOVLW	0x0b
	PAGESEL	_esperar
	CALL	_esperar
	PAGESEL	$
;	.line	32; "programa.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	33; "programa.c"	break;
	GOTO	_00117_DS_
_00107_DS_:
;	.line	35; "programa.c"	GPIO = 0b00000101; // Pares GPIO0 y GPIO2 encendidos
	MOVLW	0x05
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	37; "programa.c"	esperar(duracion);
	MOVLW	0xb8
	MOVWF	STK00
	MOVLW	0x0b
	PAGESEL	_esperar
	CALL	_esperar
	PAGESEL	$
;	.line	38; "programa.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	39; "programa.c"	break;
	GOTO	_00117_DS_
_00108_DS_:
;	.line	41; "programa.c"	GPIO = 0b00010001; // Par GPIO0  y central GPIO4 encendidos
	MOVLW	0x11
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	43; "programa.c"	esperar(duracion);
	MOVLW	0xb8
	MOVWF	STK00
	MOVLW	0x0b
	PAGESEL	_esperar
	CALL	_esperar
	PAGESEL	$
;	.line	44; "programa.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	45; "programa.c"	break;
	GOTO	_00117_DS_
_00109_DS_:
;	.line	47; "programa.c"	GPIO = 0b00000001; // Par GPIO0 encendido
	MOVLW	0x01
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	49; "programa.c"	esperar(duracion);
	MOVLW	0xb8
	MOVWF	STK00
	MOVLW	0x0b
	PAGESEL	_esperar
	CALL	_esperar
	PAGESEL	$
;	.line	50; "programa.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	51; "programa.c"	break;
	GOTO	_00117_DS_
_00110_DS_:
;	.line	53; "programa.c"	GPIO = 0b00010000; // central GPIO4 encendido
	MOVLW	0x10
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	55; "programa.c"	esperar(duracion);
	MOVLW	0xb8
	MOVWF	STK00
	MOVLW	0x0b
	PAGESEL	_esperar
	CALL	_esperar
	PAGESEL	$
;	.line	56; "programa.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	57; "programa.c"	break;
	GOTO	_00117_DS_
_00114_DS_:
;	.line	62; "programa.c"	GPIO = 0b00000000; 
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	63; "programa.c"	lfsr_generar(puntero_aleatorio);
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1015,W
	MOVWF	STK00
	MOVF	r0x1017,W
	PAGESEL	_lfsr_generar
	CALL	_lfsr_generar
	PAGESEL	$
;	.line	64; "programa.c"	resultado_dado = 1 + (valor_aleatorio % 6); //Recalcula el valor
	BANKSEL	_main_valor_aleatorio_65536_4
	MOVF	_main_valor_aleatorio_65536_4,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	BANKSEL	_main_valor_aleatorio_65536_4
	MOVF	(_main_valor_aleatorio_65536_4 + 1),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVLW	0x06
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	INCF	r0x1018,F
	BTFSC	STATUS,2
	INCF	r0x1019,F
	MOVF	r0x1018,W
	MOVWF	r0x1013
	MOVF	r0x1019,W
	MOVWF	r0x1014
	GOTO	_00117_DS_
;	.line	67; "programa.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrget2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;13 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   STK01
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   STK02
;   STK03
;   r0x1009
;   r0x100A
;; Starting pCode block
S_programa__lfsr_generar	code
_lfsr_generar:
; 2 exit points
;	.line	76; "programa.c"	void lfsr_generar(unsigned short *numero_aleatorio) { //Metodo LFSR
	BANKSEL	r0x1002
	MOVWF	r0x1002
	MOVF	STK00,W
	MOVWF	r0x1003
	MOVF	STK01,W
;	.line	77; "programa.c"	if ((*numero_aleatorio) & 1) {
	MOVWF	r0x1004
	MOVWF	STK01
	MOVF	r0x1003,W
	MOVWF	STK00
	MOVF	r0x1002,W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1006
	BTFSS	r0x1006,0
	GOTO	_00177_DS_
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
;	.line	78; "programa.c"	(*numero_aleatorio) >>= 1;
	BCF	STATUS,0
	RRF	r0x1005,W
	MOVWF	r0x1007
	RRF	r0x1006,W
	MOVWF	r0x1008
	MOVF	r0x1007,W
	MOVWF	STK02
	MOVF	r0x1008,W
	MOVWF	STK03
	MOVF	r0x1004,W
	MOVWF	STK01
	MOVF	r0x1003,W
	MOVWF	STK00
	MOVF	r0x1002,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
;	.line	79; "programa.c"	(*numero_aleatorio) ^= (1<<15) + (1<<14) + (1<<12) + (1<<3);
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	MOVWF	r0x100A
	MOVLW	0x08
	XORWF	r0x1009,W
	MOVWF	r0x1009
	MOVWF	r0x1008
	MOVLW	0xd0
	XORWF	r0x100A,W
	MOVWF	r0x1007
	MOVWF	r0x100A
	MOVWF	STK02
	MOVF	r0x1009,W
	MOVWF	STK03
	MOVF	r0x1004,W
	MOVWF	STK01
	MOVF	r0x1003,W
	MOVWF	STK00
	MOVF	r0x1002,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
	GOTO	_00179_DS_
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
_00177_DS_:
;	.line	81; "programa.c"	(*numero_aleatorio) >>= 1;
	BCF	STATUS,0
	BANKSEL	r0x1005
	RRF	r0x1005,W
	MOVWF	r0x1007
	RRF	r0x1006,W
	MOVWF	r0x1008
	MOVF	r0x1007,W
	MOVWF	STK02
	MOVF	r0x1008,W
	MOVWF	STK03
	MOVF	r0x1004,W
	MOVWF	STK01
	MOVF	r0x1003,W
	MOVWF	STK00
	MOVF	r0x1002,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
_00179_DS_:
;	.line	83; "programa.c"	}
	RETURN	
; exit point of _lfsr_generar

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x100B
;   STK00
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;; Starting pCode block
S_programa__esperar	code
_esperar:
; 2 exit points
;	.line	69; "programa.c"	void esperar(unsigned int tiempo_espera) { // funcion de espera
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	STK00,W
	MOVWF	r0x100C
;	.line	71; "programa.c"	for (i = 0; i < tiempo_espera; i++) {
	CLRF	r0x100D
	CLRF	r0x100E
_00150_DS_:
	BANKSEL	r0x100B
	MOVF	r0x100B,W
	SUBWF	r0x100E,W
	BTFSS	STATUS,2
	GOTO	_00171_DS_
	MOVF	r0x100C,W
	SUBWF	r0x100D,W
_00171_DS_:
	BTFSC	STATUS,0
	GOTO	_00152_DS_
;;genSkipc:3307: created from rifx:0x7ffc9eccb8e0
;	.line	72; "programa.c"	for (j = 0; j < 256; j++);
	BANKSEL	r0x100F
	CLRF	r0x100F
	MOVLW	0x01
	MOVWF	r0x1010
_00148_DS_:
	MOVLW	0xff
	BANKSEL	r0x100F
	ADDWF	r0x100F,W
	MOVWF	r0x1011
	MOVLW	0xff
	MOVWF	r0x1012
	MOVF	r0x1010,W
	BTFSC	STATUS,0
	INCFSZ	r0x1010,W
	ADDWF	r0x1012,F
	MOVF	r0x1011,W
	MOVWF	r0x100F
	MOVF	r0x1012,W
	MOVWF	r0x1010
	MOVF	r0x1012,W
	IORWF	r0x1011,W
	BTFSS	STATUS,2
	GOTO	_00148_DS_
;	.line	71; "programa.c"	for (i = 0; i < tiempo_espera; i++) {
	INCF	r0x100D,F
	BTFSC	STATUS,2
	INCF	r0x100E,F
	GOTO	_00150_DS_
_00152_DS_:
;	.line	74; "programa.c"	}
	RETURN	
; exit point of _esperar


;	code size estimation:
;	  232+   62 =   294 instructions (  712 byte)

	end
