	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080251AC
sub_080251AC: @ 0x080251AC
	push {lr}
	ldr r0, _080251B8 @ =gUnknown_030013D0
	bl sub_0802505C
	pop {r0}
	bx r0
	.align 2, 0
_080251B8: .4byte gUnknown_030013D0

