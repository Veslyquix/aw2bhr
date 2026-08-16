	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040150
sub_08040150: @ 0x08040150
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x2c]
	lsls r1, r1, #4
	ldr r2, _08040188 @ =gUnknown_08499590
	ldr r3, [r2]
	movs r5, #4
	ldrsh r2, [r3, r5]
	subs r2, #8
	subs r1, r1, r2
	ldr r2, [r4, #0x30]
	lsls r2, r2, #4
	movs r5, #6
	ldrsh r3, [r3, r5]
	subs r3, #0x10
	subs r2, r2, r3
	bl sub_0801C254
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040182
	adds r0, r4, #0
	bl Proc_Break
_08040182:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040188: .4byte gUnknown_08499590

