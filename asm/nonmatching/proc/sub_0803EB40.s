	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803EB40
sub_0803EB40: @ 0x0803EB40
	ldr r2, _0803EB4C @ =gUnknown_02028360
	ldrh r1, [r2, #2]
	movs r3, #0xf0
	lsls r3, r3, #2
	b _0803EB70
	.align 2, 0
_0803EB4C: .4byte gUnknown_02028360
_0803EB50:
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #5
	bgt _0803EB6C
	cmp r0, #1
	blt _0803EB6C
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0803EB6C
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	strb r0, [r2, #6]
_0803EB6C:
	adds r2, #8
	ldrh r1, [r2, #2]
_0803EB70:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0803EB50
	bx lr
	.align 2, 0

