	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078958
sub_08078958: @ 0x08078958
	push {lr}
	ldr r0, _08078964 @ =gUnknown_08615B4C
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08078964: .4byte gUnknown_08615B4C

