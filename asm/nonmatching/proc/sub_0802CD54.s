	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CD54
sub_0802CD54: @ 0x0802CD54
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802CD74 @ =gUnknown_030040F0
	str r1, [r0]
	bl sub_0801A614
	bl sub_0801A168
	bl sub_08034F10
	bl sub_08046764
	pop {r0}
	bx r0
	.align 2, 0
_0802CD74: .4byte gUnknown_030040F0

