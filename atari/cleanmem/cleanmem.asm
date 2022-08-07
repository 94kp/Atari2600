	processor 6502

	seg code
	org $F000	; Define the code origin at $F000

Start:
	sei		; Disable interrupts
	cld		; Disable the BCD math mode
	ldx #$FF	; Load X register with #$FF
	txs		; Transfer X register to stack pointer
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero region ($00 to $FF)
; Meaning the entire RAM and also the entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	lda #0		; A = 0
	ldx #$FF	; X = #$FF
	
MemLoop:
	sta $0,X	; Store the value of A inside memory address $0 + X
	dex		; X--
	bne MemLoop	; Loop until X is equal to zero (z-flag is set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	org $FFFC	; Move to address $FFFC
	.word Start	; Reset Vector at $FFFC (where the program starts) 2 bytes
	.word Start	; Interrupt vector at $FFFE (unused in the VCS) 2 bytes


