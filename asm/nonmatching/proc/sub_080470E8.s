	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080470E8
sub_080470E8: @ 0x080470E8
	push {lr}
	ldr r0, _080470F4 @ =gUnknown_084C2198
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_080470F4: .4byte gUnknown_084C2198

