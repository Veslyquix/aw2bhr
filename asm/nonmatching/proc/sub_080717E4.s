	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080717E4
sub_080717E4: @ 0x080717E4
	push {lr}
	ldr r2, _080717F4 @ =gUnknown_03005740
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080717F4: .4byte gUnknown_03005740

