	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803DEEC
sub_0803DEEC: @ 0x0803DEEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	mov ip, r2
	ldr r3, _0803DF38 @ =gUnknown_02028360
	ldrh r5, [r3, #2]
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	beq _0803DF48
	mov r8, r1
_0803DF0A:
	ldrb r2, [r3]
	ldrb r1, [r3, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r4, r2, r0
	ldrb r0, [r3, #1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	adds r1, r0, r1
	cmp r7, r2
	blt _0803DF3C
	cmp r6, r0
	blt _0803DF3C
	cmp r7, r4
	bge _0803DF3C
	cmp r6, r1
	bge _0803DF3C
	lsls r0, r5, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, ip
	bne _0803DF3C
	adds r0, r3, #0
	b _0803DF4A
	.align 2, 0
_0803DF38: .4byte gUnknown_02028360
_0803DF3C:
	adds r3, #8
	ldrh r5, [r3, #2]
	mov r0, r8
	ands r0, r5
	cmp r0, #0
	bne _0803DF0A
_0803DF48:
	movs r0, #0
_0803DF4A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

