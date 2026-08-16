	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080845E8
sub_080845E8: @ 0x080845E8
	push {lr}
	ldr r0, _080845F8 @ =gUnknown_0823D980
	ldr r1, _080845FC @ =0x06015300
	bl sub_08011CAC
	pop {r0}
	bx r0
	.align 2, 0
_080845F8: .4byte gUnknown_0823D980
_080845FC: .4byte 0x06015300

