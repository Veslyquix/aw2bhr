	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074ED0
sub_08074ED0: @ 0x08074ED0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074EE8 @ =gUnknown_08614344
	bl Proc_Start
	str r4, [r0, #0x54]
	movs r1, #0
	str r1, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074EE8: .4byte gUnknown_08614344

