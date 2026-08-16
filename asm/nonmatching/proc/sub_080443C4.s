	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080443C4
sub_080443C4: @ 0x080443C4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080443D4 @ =gUnknown_084A07E8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080443D4: .4byte gUnknown_084A07E8

