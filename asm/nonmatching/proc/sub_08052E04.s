	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052E04
sub_08052E04: @ 0x08052E04
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _08052E6C @ =gUnknown_0300453C
	strh r5, [r0]
	ldr r0, _08052E70 @ =gUnknown_0300451C
	strh r4, [r0]
	ldr r2, _08052E74 @ =gUnknown_02029A10
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r6, r0, r2
	ldrb r0, [r6, #1]
	cmp r0, #0
	bne _08052E66
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08052E66
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08051D74
	ldr r1, _08052E78 @ =gUnknown_02029B80
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	ldr r1, _08052E7C @ =gUnknown_02029BA8
	lsls r2, r5, #5
	adds r1, #0x14
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
	ldr r0, _08052E80 @ =0x0000FFFF
	strh r0, [r6, #0x18]
_08052E66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052E6C: .4byte gUnknown_0300453C
_08052E70: .4byte gUnknown_0300451C
_08052E74: .4byte gUnknown_02029A10
_08052E78: .4byte gUnknown_02029B80
_08052E7C: .4byte gUnknown_02029BA8
_08052E80: .4byte 0x0000FFFF

