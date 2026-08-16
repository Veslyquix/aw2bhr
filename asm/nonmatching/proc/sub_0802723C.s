	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802723C
sub_0802723C: @ 0x0802723C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08027270 @ =gUnknown_08499D2C
	movs r1, #3
	bl Proc_Start
	lsls r4, r4, #4
	ldr r1, _08027274 @ =gUnknown_08499590
	ldr r2, [r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r4, r4, r1
	subs r4, #0x18
	str r4, [r0, #0x2c]
	lsls r5, r5, #4
	movs r3, #6
	ldrsh r1, [r2, r3]
	subs r5, r5, r1
	str r5, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x54]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027270: .4byte gUnknown_08499D2C
_08027274: .4byte gUnknown_08499590

