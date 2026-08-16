	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BE60
sub_0803BE60: @ 0x0803BE60
	push {r4, r5, lr}
	ldr r0, _0803BEC4 @ =gUnknown_0849ECDC
	ldr r0, [r0]
	ldrb r2, [r0]
	movs r1, #1
	cmp r1, r2
	bhi _0803BE80
	ldr r4, _0803BEC8 @ =gUnknown_03003FF8
	movs r3, #1
_0803BE72:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	bls _0803BE72
_0803BE80:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bhi _0803BE9C
	ldr r3, _0803BEC8 @ =gUnknown_03003FF8
	movs r2, #0
_0803BE8E:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0803BE8E
_0803BE9C:
	movs r1, #1
	ldr r2, _0803BECC @ =gUnknown_03003FC0
	adds r5, r2, #0
	adds r5, #0x10
	ldr r4, _0803BED0 @ =0x000186A0
	movs r3, #0xfa
	lsls r3, r3, #2
_0803BEAA:
	lsls r0, r1, #2
	adds r0, r0, r5
	str r4, [r0]
	str r3, [r2, #0x28]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0803BEAA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803BEC4: .4byte gUnknown_0849ECDC
_0803BEC8: .4byte gUnknown_03003FF8
_0803BECC: .4byte gUnknown_03003FC0
_0803BED0: .4byte 0x000186A0

