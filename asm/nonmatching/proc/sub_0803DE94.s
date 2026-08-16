	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803DE94
sub_0803DE94: @ 0x0803DE94
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r3, _0803DED4 @ =gUnknown_02028360
	ldrh r1, [r3, #2]
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803DEE4
	adds r7, r2, #0
_0803DEAC:
	ldrb r2, [r3]
	ldrb r1, [r3, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r4, r2, r0
	ldrb r0, [r3, #1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	adds r1, r0, r1
	cmp r6, r2
	blt _0803DED8
	cmp r5, r0
	blt _0803DED8
	cmp r6, r4
	bge _0803DED8
	cmp r5, r1
	bge _0803DED8
	adds r0, r3, #0
	b _0803DEE6
	.align 2, 0
_0803DED4: .4byte gUnknown_02028360
_0803DED8:
	adds r3, #8
	ldrh r1, [r3, #2]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803DEAC
_0803DEE4:
	movs r0, #0
_0803DEE6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

