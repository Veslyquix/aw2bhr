	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804050C
sub_0804050C: @ 0x0804050C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r4, _08040550 @ =gUnknown_08499590
	ldr r3, [r4]
	movs r1, #4
	ldrsh r2, [r3, r1]
	ldr r1, [r5, #0x2c]
	subs r1, r1, r2
	movs r2, #6
	ldrsh r3, [r3, r2]
	ldr r2, [r5, #0x30]
	subs r2, r2, r3
	bl sub_0801C254
	ldr r0, [r5, #0x30]
	subs r0, #5
	str r0, [r5, #0x30]
	ldr r1, [r4]
	movs r2, #6
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	cmp r0, #0
	bge _08040548
	ldr r0, [r5, #0x50]
	bl sub_0801C240
	adds r0, r5, #0
	bl Proc_Break
_08040548:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040550: .4byte gUnknown_08499590

