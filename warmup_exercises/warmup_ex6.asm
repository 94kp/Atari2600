	processor 6502
	seg Code
	org $F000

Start:
	LDA #1
	LDX #2
	LDY #3
	INX
	INY

	clc
	adc #1

	DEX
	DEY
	
	sec
	sbc #1

	jmp Start

	org $FFFC
	.word Start
	.word Start
