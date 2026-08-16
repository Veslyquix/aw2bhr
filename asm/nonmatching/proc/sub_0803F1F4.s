	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F1F4
sub_0803F1F4: @ 0x0803F1F4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0803F128
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x68
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_0803F27C
	adds r0, #2
	adds r1, r5, #0
	adds r1, #0x64
	movs r6, #0
	ldrsh r1, [r1, r6]
	lsls r1, r1, #4
	ldr r2, _0803F270 @ =gUnknown_08499590
	ldr r3, [r2]
	movs r6, #4
	ldrsh r2, [r3, r6]
	subs r1, r1, r2
	adds r1, #8
	adds r2, r5, #0
	adds r2, #0x66
	movs r6, #0
	ldrsh r2, [r2, r6]
	lsls r2, r2, #4
	movs r6, #6
	ldrsh r3, [r3, r6]
	subs r2, r2, r3
	adds r2, #0x10
	ldr r3, _0803F274 @ =0x000031CA
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	bl sub_0801C70C
	ldr r0, _0803F278 @ =0x000001C3
	bl sub_0803B4DC
	movs r0, #1
	movs r1, #0x14
	adds r2, r5, #0
	bl sub_08013338
	movs r0, #2
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl sub_080130DC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F270: .4byte gUnknown_08499590
_0803F274: .4byte 0x000031CA
_0803F278: .4byte 0x000001C3

