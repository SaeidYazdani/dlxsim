.global _exit
.global _open
.global _close
.global _read
.global _write
.global _printf

	.align 4
.global _fill_grid
_fill_grid:
	;; Save the old frame pointer 
	sw -4(r14),r30
	;; Save the return address 
	sw -8(r14),r31
	;; Establish new frame pointer 
	add r30,r0,r14
	;; Adjust Stack Pointer 
	add r14,r14,#-40
	;; Save Registers 
	sw 0(r14),r3
	sw 4(r14),r4
	sw 8(r14),r5
	nop
	sw -12(r30),r0
L2:
	lw r3,-12(r30)
	addi r4,r0,#15
		;cmpsi	r3,r4
	sgt	r1,r3,r4
	bnez	r1,L3

	sw -20(r30),r0
L5:
	lw r3,-20(r30)
	addi r4,r0,#15
		;cmpsi	r3,r4
	sgt	r1,r3,r4
	bnez	r1,L6
	
	lw r3,-20(r30)
	addi r4,r0,#0
		;cmpsi	r3,r4
	sne	r1,r3,r4
	bnez	r1,L8
	
	lw r3,-12(r30)
	lhi r4,(_GRID>>16)&0xffff
	addui r4,r4,(_GRID&0xffff)
	slli r3,r3,#5
	add r3,r4,r3
	lw r4,-20(r30)
	slli r4,r4,#1
	add r3,r3,r4
	add r5,r0,#5000
	sh 0(r3),r5
	j L9
	
L8:
	lw r3,-12(r30)
	addi r4,r0,#0
		;cmpsi	r3,r4
	sne	r1,r3,r4
	bnez	r1,L10
	
	lw r3,-12(r30)
	lhi r4,(_GRID>>16)&0xffff
	addui r4,r4,(_GRID&0xffff)
	slli r3,r3,#5
	add r3,r4,r3
	lw r4,-20(r30)
	slli r4,r4,#1
	add r3,r3,r4
	add r5,r0,#3000
	sh 0(r3),r5
	j L11
	
L10:
	lw r3,-12(r30)
	addi r4,r0,#15
		;cmpsi	r3,r4
	sne	r1,r3,r4
	bnez	r1,L12
	
	lw r3,-12(r30)
	lhi r4,(_GRID>>16)&0xffff
	addui r4,r4,(_GRID&0xffff)
	slli r3,r3,#5
	add r3,r4,r3
	lw r4,-20(r30)
	slli r4,r4,#1
	add r3,r3,r4
	add r5,r0,#6000
	sh 0(r3),r5
	j L13
	
L12:
	lw r3,-20(r30)
	addi r4,r0,#15
		;cmpsi	r3,r4
	sne	r1,r3,r4
	bnez	r1,L14
	
	lw r3,-12(r30)
	lhi r4,(_GRID>>16)&0xffff
	addui r4,r4,(_GRID&0xffff)
	slli r3,r3,#5
	add r3,r4,r3
	lw r4,-20(r30)
	slli r4,r4,#1
	add r3,r3,r4
	add r5,r0,#10000
	sh 0(r3),r5
	j L15
	
L14:
	lw r3,-12(r30)
	lhi r4,(_GRID>>16)&0xffff
	addui r4,r4,(_GRID&0xffff)
	slli r3,r3,#5
	add r3,r4,r3
	lw r4,-20(r30)
	slli r4,r4,#1
	add r3,r3,r4
	sh 0(r3),r0
L15:
L13:
L11:
L9:
L7:
	lw r3,-20(r30)
	lw r3,-20(r30)
	add r3,r3,#1
	sw -20(r30),r3
	j L5
	
L6:
L4:
	lw r3,-12(r30)
	lw r3,-12(r30)
	add r3,r3,#1
	sw -12(r30),r3
	j L2
	
L3:
L1:
	;; Restore the saved registers
	lw r3,-40(r30)
	nop
	lw r4,-36(r30)
	nop
	lw r5,-32(r30)
	nop
	;; Restore return address
	lw r31,-8(r30)
	nop
	;; Restore stack pointer
	add r14,r0,r30
	;; Restore frame pointer
	lw r30,-4(r30)
	nop
	;; Return
	jr r31
	
LC0:
	.ascii "The array sum answer is %d\11\0"
	.align 4
.global _dump_array
_dump_array:
	;; Save the old frame pointer 
	sw -4(r14),r30
	;; Save the return address 
	sw -8(r14),r31
	;; Establish new frame pointer 
	add r30,r0,r14
	;; Adjust Stack Pointer 
	add r14,r14,#-48
	;; Save Registers 
	sw 0(r14),r3
	sw 4(r14),r4
	sw 8(r14),r5
	sw -28(r30),r0
	nop
	sw -20(r30),r0
L17:
	lw r3,-20(r30)
	addi r4,r0,#15
		;cmpsi	r3,r4
	sgt	r1,r3,r4
	bnez	r1,L18
	
	sw -12(r30),r0
L20:
	lw r3,-12(r30)
	addi r4,r0,#15
		;cmpsi	r3,r4
	sgt	r1,r3,r4
	bnez	r1,L21
	
	lw r3,-12(r30)
	lhi r4,(_GRID>>16)&0xffff
	addui r4,r4,(_GRID&0xffff)
	slli r3,r3,#5
	add r3,r4,r3
	lw r4,-20(r30)
	slli r4,r4,#1
	add r3,r3,r4
	lh r3,0(r3)
	lw r4,-28(r30)
	add r3,r4,r3
	sw -28(r30),r3
L22:
	lw r3,-12(r30)
	lw r3,-12(r30)
	add r3,r3,#1
	sw -12(r30),r3
	j L20
	
L21:
L19:
	lw r3,-20(r30)
	lw r3,-20(r30)
	add r3,r3,#1
	sw -20(r30),r3
	j L17
	
L18:
	sub r14,r14,#8
	lhi r5,(LC0>>16)&0xffff
	addui r5,r5,(LC0&0xffff)
	sw 0(r14),r5
	lw r5,-28(r30)
	sw 4(r14),r5
	jal _printf
	
	add r14,r14,#8
L16:
	;; Restore the saved registers
	lw r3,-48(r30)
	nop
	lw r4,-44(r30)
	nop
	lw r5,-40(r30)
	nop
	;; Restore return address
	lw r31,-8(r30)
	nop
	;; Restore stack pointer
	add r14,r0,r30
	;; Restore frame pointer
	lw r30,-4(r30)
	nop
	;; Return
	jr r31
	
LC1:
	.ascii "\12\0"
	.align 4
.global _main
_main:
	;; Initialize Stack Pointer
	add r14,r0,r0
	lhi r14, ((memSize-4)>>16)&0xffff
	addui r14, r14, ((memSize-4)&0xffff)
	;; Save the old frame pointer 
	sw -4(r14),r30
	;; Save the return address 
	sw -8(r14),r31
	;; Establish new frame pointer 
	add r30,r0,r14
	;; Adjust Stack Pointer 
	add r14,r14,#-56
	;; Save Registers 
	sw 0(r14),r3
	sw 4(r14),r4
	sw 8(r14),r5
	sw 12(r14),r6
	sw 16(r14),r7
	sw 20(r14),r8
	jal _fill_grid
	;; 2 NOPS WERE HERE. REMOVED ONE
	nop
	sw -12(r30),r0
L24:
	lw r3,-12(r30)
	addi r4,r0,#99
		;cmpsi	r3,r4
	sgt	r1,r3,r4
	bnez	r1,L25
	
	addi r8,r0,#1
	sw -20(r30),r8
L27:
	lw r3,-20(r30)
	addi r4,r0,#14
		;cmpsi	r3,r4
	sgt	r1,r3,r4
	bnez	r1,L28
	
	addi r8,r0,#1
	sw -28(r30),r8
L30:
	lw r3,-28(r30)
	addi r4,r0,#14
		;cmpsi	r3,r4
	sgt	r1,r3,r4
	bnez	r1,L31
	
	lw r3,-20(r30)
	lhi r4,(_GRID>>16)&0xffff
	addui r4,r4,(_GRID&0xffff)
	slli r3,r3,#5
	add r3,r4,r3
	lw r4,-28(r30)
	slli r4,r4,#1
	add r3,r3,r4
	lhi r4,(_GRID-32>>16)&0xffff
	addui r4,r4,(_GRID-32&0xffff)
	lw r5,-20(r30)
	slli r5,r5,#5
	add r4,r4,r5
	lw r5,-28(r30)
	slli r5,r5,#1
	add r4,r4,r5
	lh r4,0(r4)
	lhi r5,(_GRID+32>>16)&0xffff
	addui r5,r5,(_GRID+32&0xffff)
	lw r6,-20(r30)
	slli r6,r6,#5
	add r5,r5,r6
	lw r6,-28(r30)
	slli r6,r6,#1
	add r5,r5,r6
	lh r5,0(r5)
	add r4,r4,r5
	lw r5,-20(r30)
	lhi r6,(_GRID>>16)&0xffff
	addui r6,r6,(_GRID&0xffff)
	slli r5,r5,#5
	add r5,r6,r5
	addi r6,r0,#-2
	lw r7,-28(r30)
	slli r7,r7,#1
	add r5,r7,r5
	add r5,r5,r6
	lh r5,0(r5)
	add r4,r4,r5
	lw r5,-20(r30)
	lhi r6,(_GRID>>16)&0xffff
	addui r6,r6,(_GRID&0xffff)
	slli r5,r5,#5
	add r5,r6,r5
	addi r6,r0,#2
	lw r7,-28(r30)
	slli r7,r7,#1
	add r5,r7,r5
	add r5,r5,r6
	lh r5,0(r5)
	add r4,r4,r5
	add r4,r0,r4
	addi r5,r0,#0
		;cmpsi	r4,r5
	sge	r1,r4,r5
	bnez	r1,L33
	
	add r4,r4,#3
L33:
	srai r4,r4,#2
	sh 0(r3),r4
L32:
	lw r3,-28(r30)
	lw r3,-28(r30)
	add r3,r3,#1
	sw -28(r30),r3
	j L30
	
L31:
L29:
	lw r3,-20(r30)
	lw r3,-20(r30)
	add r3,r3,#1
	sw -20(r30),r3
	j L27
	
L28:
L26:
	lw r3,-12(r30)
	lw r3,-12(r30)
	add r3,r3,#1
	sw -12(r30),r3
	j L24
	
L25:
	jal _dump_array
	
	sub r14,r14,#8
	lhi r8,(LC1>>16)&0xffff
	addui r8,r8,(LC1&0xffff)
	sw 0(r14),r8
	jal _printf
	
	add r14,r14,#8
L23:
	;; Restore the saved registers
	lw r3,-56(r30)
	nop
	lw r4,-52(r30)
	nop
	lw r5,-48(r30)
	nop
	lw r6,-44(r30)
	nop
	lw r7,-40(r30)
	nop
	lw r8,-36(r30)
	nop
	;; Restore return address
	lw r31,-8(r30)
	nop
	;; Restore stack pointer
	add r14,r0,r30
	;; Restore frame pointer
	lw r30,-4(r30)
	nop
	;; HALT
	jal _exit
	

_exit:
	trap #0
	jr r31
	
_open:
	trap #1
	jr r31
	
_close:
	trap #2
	jr r31
	
_read:
	trap #3
	jr r31
	
_write:
	trap #4
	jr r31
	
_printf:
	trap #5
	jr r31
	
.global _GRID
_GRID:	.space 512
