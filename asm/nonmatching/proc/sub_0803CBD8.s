	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CBD8
sub_0803CBD8: @ 0x0803CBD8
	adds r2, r0, #0
	adds r1, r2, #0
	subs r1, #0x60
	cmp r1, #0x3f
	bhi _0803CBF4
	adds r2, r1, #0
	ldr r0, _0803CBF0 @ =gUnknown_02028030
	asrs r1, r2, #3
	adds r0, #8
	adds r1, r1, r0
	ldrb r3, [r1]
	b _0803CC06
	.align 2, 0
_0803CBF0: .4byte gUnknown_02028030
_0803CBF4:
	adds r1, r2, #0
	subs r1, #0x20
	cmp r1, #0x3f
	bhi _0803CC24
	adds r2, r1, #0
	ldr r1, _0803CC20 @ =gUnknown_02028030
	asrs r0, r2, #3
	adds r0, r0, r1
	ldrb r3, [r0]
_0803CC06:
	adds r0, r2, #0
	cmp r2, #0
	bge _0803CC0E
	adds r0, r2, #7
_0803CC0E:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r2, r0
	asrs r3, r0
	movs r0, #1
	ands r3, r0
	adds r0, r3, #0
	b _0803CC36
	.align 2, 0
_0803CC20: .4byte gUnknown_02028030
_0803CC24:
	cmp r2, #0x1f
	bhi _0803CC36
	ldr r1, _0803CC38 @ =gUnknown_030033F4
	asrs r0, r2, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
_0803CC36:
	bx lr
	.align 2, 0
_0803CC38: .4byte gUnknown_030033F4

