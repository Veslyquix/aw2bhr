	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078240
sub_08078240: @ 0x08078240
	push {lr}
	ldr r0, _0807824C @ =gUnknown_086143E0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807824C: .4byte gUnknown_086143E0

