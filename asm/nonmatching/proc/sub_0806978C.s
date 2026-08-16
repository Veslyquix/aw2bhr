	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806978C
sub_0806978C: @ 0x0806978C
	push {lr}
	ldr r0, _080697A0 @ =gUnknown_08581420
	bl Proc_Find
	adds r0, #0x36
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080697A0: .4byte gUnknown_08581420

