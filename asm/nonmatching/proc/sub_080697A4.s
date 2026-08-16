	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080697A4
sub_080697A4: @ 0x080697A4
	push {lr}
	ldr r0, _080697B8 @ =gUnknown_08581420
	bl Proc_Find
	adds r0, #0x36
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080697B8: .4byte gUnknown_08581420

