	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805DCA4
sub_0805DCA4: @ 0x0805DCA4
	push {lr}
	ldr r0, _0805DCC0 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0805DCCE
	ldrb r0, [r2]
	cmp r0, #7
	beq _0805DCC4
	cmp r0, #0x14
	beq _0805DCCA
	b _0805DCCE
	.align 2, 0
_0805DCC0: .4byte gUnknown_030040D8
_0805DCC4:
	bl sub_08059760
	b _0805DCCE
_0805DCCA:
	bl sub_08059824
_0805DCCE:
	pop {r0}
	bx r0
	.align 2, 0

