	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080404A0
sub_080404A0: @ 0x080404A0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	lsls r1, r1, #4
	adds r1, #8
	str r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #4
	adds r2, #0x10
	str r2, [r4, #0x30]
	ldr r5, _08040504 @ =gUnknown_08111D94
	ldr r0, _08040508 @ =gUnknown_08499590
	ldr r3, [r0]
	movs r6, #4
	ldrsh r0, [r3, r6]
	subs r1, r1, r0
	movs r6, #6
	ldrsh r0, [r3, r6]
	subs r2, r2, r0
	adds r6, r4, #0
	adds r6, #0x4a
	ldrh r3, [r6]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	bl sub_0801C70C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #1
	bl sub_0801C210
	str r0, [r4, #0x50]
	movs r1, #1
	bl sub_0801C4D4
	ldr r1, [r4, #0x50]
	ldrh r0, [r6]
	strh r0, [r1, #0x22]
	movs r0, #0xe3
	lsls r0, r0, #1
	bl sub_0803B4DC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040504: .4byte gUnknown_08111D94
_08040508: .4byte gUnknown_08499590

