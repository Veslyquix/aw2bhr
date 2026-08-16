	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803EAD0
sub_0803EAD0: @ 0x0803EAD0
	push {r4, r5, r6, lr}
	ldr r3, _0803EAFC @ =gUnknown_02028360
	ldrh r1, [r3, #2]
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803EB3A
	ldr r4, _0803EB00 @ =gUnknown_030033EC
	ldr r6, _0803EB04 @ =gUnknown_08499598
	adds r5, r2, #0
_0803EAE8:
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #2
	beq _0803EB0E
	cmp r0, #2
	bgt _0803EB08
	cmp r0, #1
	beq _0803EB16
	b _0803EB2E
	.align 2, 0
_0803EAFC: .4byte gUnknown_02028360
_0803EB00: .4byte gUnknown_030033EC
_0803EB04: .4byte gUnknown_08499598
_0803EB08:
	cmp r0, #5
	bgt _0803EB2E
	b _0803EB16
_0803EB0E:
	ldrh r0, [r4]
	cmp r0, #1
	bne _0803EB2E
	b _0803EB28
_0803EB16:
	ldrh r1, [r4]
	ldr r2, [r6]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	cmp r0, #5
	bne _0803EB2E
_0803EB28:
	ldrb r0, [r3, #6]
	subs r0, #1
	strb r0, [r3, #6]
_0803EB2E:
	adds r3, #8
	ldrh r1, [r3, #2]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0803EAE8
_0803EB3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

