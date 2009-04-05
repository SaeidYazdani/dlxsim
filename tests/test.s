.global _main
_main:
	lhi r3, #1 ;;hope that the lower bits have something useful
L1:	bnez r3, exit
	nop
	subi r3, r3, 1
	j L1
	nop
exit:
        trap #0
	nop
        jr r31
        nop



