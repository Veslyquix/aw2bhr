	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054F50
sub_08054F50: @ 0x08054F50
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	beq _08054FBC
	ldr r1, _08054FA8 @ =gUnknown_03004580
	lsls r0, r6, #4
	adds r0, r0, r1
	ldrh r5, [r0]
	lsls r4, r6, #0xd
	movs r1, #0xa0
	lsls r1, r1, #4
	adds r0, r1, #0
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r6, #8
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _08054FAC @ =gUnknown_0854E67C
	ldr r1, _08054FB0 @ =0x06010000
	adds r1, r4, r1
	movs r2, #0xd2
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r1, _08054FB4 @ =gUnknown_08553D80
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, #0x68
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08054FB8 @ =0x06010D40
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #0x88
	bl CpuFastSet
	b _08054FBE
	.align 2, 0
_08054FA8: .4byte gUnknown_03004580
_08054FAC: .4byte gUnknown_0854E67C
_08054FB0: .4byte 0x06010000
_08054FB4: .4byte gUnknown_08553D80
_08054FB8: .4byte 0x06010D40
_08054FBC:
	movs r7, #0x50
_08054FBE:
	ldr r2, _08054FF4 @ =gUnknown_020297C0
	lsls r1, r6, #3
	adds r1, r1, r6
	lsls r0, r1, #2
	adds r0, r0, r2
	strh r7, [r0]
	ldr r2, _08054FF8 @ =gUnknown_020296B0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r7, [r0]
	ldr r0, _08054FFC @ =gUnknown_020298E0
	lsls r1, r1, #4
	adds r1, r1, r0
	strh r7, [r1]
	ldr r1, _08055000 @ =gUnknown_02029710
	movs r0, #0x58
	muls r0, r6, r0
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x6a
	strh r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054FF4: .4byte gUnknown_020297C0
_08054FF8: .4byte gUnknown_020296B0
_08054FFC: .4byte gUnknown_020298E0
_08055000: .4byte gUnknown_02029710

