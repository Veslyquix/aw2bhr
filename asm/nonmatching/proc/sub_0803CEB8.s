	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CEB8
sub_0803CEB8: @ 0x0803CEB8
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	ldr r4, _0803CEFC @ =gUnknown_02000000
	adds r1, r4, #0
	bl sub_0801AC58
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0803D3D8
	ldr r3, _0803CF00 @ =gUnknown_03003FC0
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r2, r3, #0
	adds r2, #0x36
	ldrb r2, [r2]
	adds r3, #0x37
	ldrb r3, [r3]
	bl sub_08026040
	bl sub_08024268
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CEFC: .4byte gUnknown_02000000
_0803CF00: .4byte gUnknown_03003FC0

