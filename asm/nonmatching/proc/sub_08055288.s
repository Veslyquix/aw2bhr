	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055288
sub_08055288: @ 0x08055288
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	ldr r2, _080552FC @ =gUnknown_085D6A48
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	beq _080552F2
	cmp r3, #1
	bne _080552F2
	ldr r1, _08055300 @ =gUnknown_02029710
	movs r0, #0x58
	muls r0, r6, r0
	adds r0, r0, r1
	strh r5, [r0]
	lsls r0, r5, #0x15
	lsrs r6, r0, #0x10
	ldr r3, _08055304 @ =gUnknown_08553D80
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #2
	ldrh r2, [r2, #0x14]
	movs r1, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r0, r3
	ldrh r4, [r1]
	adds r3, #4
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r4, #0
	beq _080552EA
	ldr r1, _08055308 @ =0x06010000
	adds r1, r6, r1
	lsrs r2, r4, #2
	bl CpuFastSet
_080552EA:
	lsrs r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080552F2:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080552FC: .4byte gUnknown_085D6A48
_08055300: .4byte gUnknown_02029710
_08055304: .4byte gUnknown_08553D80
_08055308: .4byte 0x06010000

