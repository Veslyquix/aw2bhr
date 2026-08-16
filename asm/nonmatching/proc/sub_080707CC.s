	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080707CC
sub_080707CC: @ 0x080707CC
	push {lr}
	ldr r1, _080707DC @ =gUnknown_030057C8
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080707DC: .4byte gUnknown_030057C8

