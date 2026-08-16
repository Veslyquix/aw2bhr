	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807472C
sub_0807472C: @ 0x0807472C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074740 @ =gUnknown_086142B4
	bl Proc_Find
	lsls r4, r4, #0xa
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074740: .4byte gUnknown_086142B4

