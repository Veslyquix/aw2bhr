	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C210
sub_0801C210: @ 0x0801C210
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r0, #0
	bl sub_0801C6E8
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C236
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_0801C69C
	adds r0, r4, #0
	b _0801C238
_0801C236:
	movs r0, #0
_0801C238:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

