	processor 6502
	seg Code
	org $F000

Start:
	ldy #10

Loop:
	TYA
	STA $80,Y
	DEY
	bpl Loop	; branch if plus (result of last instruction was positive)

	org $FFFC
	.word Start
	.word Start
