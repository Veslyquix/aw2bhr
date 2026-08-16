	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08051D74
sub_08051D74: @ 0x08051D74
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08051DD4 @ =gUnknown_02029A10
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r2, #0xb4
	muls r2, r5, r2
	adds r0, r0, r2
	adds r4, r0, r3
	movs r0, #0
	strb r0, [r4]
	ldr r2, _08051DD8 @ =gUnknown_02029B80
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0]
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08051DCC
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08051DCC
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	ldr r1, _08051DDC @ =gUnknown_02029BA8
	lsls r2, r5, #5
	adds r1, #0x14
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
_08051DCC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051DD4: .4byte gUnknown_02029A10
_08051DD8: .4byte gUnknown_02029B80
_08051DDC: .4byte gUnknown_02029BA8

