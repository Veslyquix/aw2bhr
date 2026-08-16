	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087884
sub_08087884: @ 0x08087884
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08087898 @ =gUnknown_08616D94
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087898: .4byte gUnknown_08616D94

