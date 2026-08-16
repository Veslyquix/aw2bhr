	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078018
sub_08078018: @ 0x08078018
	push {lr}
	bl sub_08074744
	bl sub_08074F1C
	bl sub_08075304
	bl sub_080755E0
	ldr r0, _08078034 @ =gUnknown_086143E0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08078034: .4byte gUnknown_086143E0

