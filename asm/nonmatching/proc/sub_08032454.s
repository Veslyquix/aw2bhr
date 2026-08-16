	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032454
sub_08032454: @ 0x08032454
	push {lr}
	adds r1, r0, #0
	ldr r0, _08032464 @ =gUnknown_0849B62C
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08032464: .4byte gUnknown_0849B62C

