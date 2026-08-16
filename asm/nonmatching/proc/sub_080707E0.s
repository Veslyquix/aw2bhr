	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080707E0
sub_080707E0: @ 0x080707E0
	push {lr}
	ldr r1, _080707F0 @ =gUnknown_030057CC
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080707F0: .4byte gUnknown_030057CC

