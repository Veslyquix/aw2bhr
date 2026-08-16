	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080767A8
sub_080767A8: @ 0x080767A8
	push {lr}
	ldr r0, _080767BC @ =gUnknown_086144FC
	bl Proc_Find
	adds r0, #0x64
	movs r1, #1
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080767BC: .4byte gUnknown_086144FC

