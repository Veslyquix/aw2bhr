	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067898
sub_08067898: @ 0x08067898
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080678B8 @ =gUnknown_08580FF4
	bl Proc_Start
	str r4, [r0, #0x58]
	str r5, [r0, #0x5c]
	movs r1, #1
	str r1, [r0, #0x60]
	str r6, [r0, #0x3c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080678B8: .4byte gUnknown_08580FF4

