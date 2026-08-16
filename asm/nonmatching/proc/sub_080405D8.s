	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080405D8
sub_080405D8: @ 0x080405D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r1, _08040620 @ =gUnknown_08499590
	ldr r3, [r1]
	movs r1, #4
	ldrsh r2, [r3, r1]
	ldr r1, [r5, #0x54]
	subs r1, r1, r2
	adds r4, r5, #0
	adds r4, #0x66
	movs r6, #0
	ldrsh r2, [r4, r6]
	movs r6, #6
	ldrsh r3, [r3, r6]
	subs r2, r2, r3
	bl sub_0801C254
	ldrh r0, [r4]
	adds r0, #8
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r5, #0x30]
	lsls r0, r0, #4
	cmp r1, r0
	ble _0804061A
	ldr r0, [r5, #0x50]
	bl sub_0801C240
	adds r0, r5, #0
	bl Proc_Break
_0804061A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040620: .4byte gUnknown_08499590

