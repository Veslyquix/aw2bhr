	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080366A4
sub_080366A4: @ 0x080366A4
	push {lr}
	bl sub_08011B18
	ldr r0, _080366BC @ =sub_08036884
	bl sub_080366D0
	ldr r0, _080366C0 @ =sub_080368E8
	bl sub_080366C4
	pop {r0}
	bx r0
	.align 2, 0
_080366BC: .4byte sub_08036884
_080366C0: .4byte sub_080368E8

