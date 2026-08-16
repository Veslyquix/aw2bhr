	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C5D4
sub_0802C5D4: @ 0x0802C5D4
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802C5EC @ =gUnknown_030040F0
	str r1, [r0]
	bl sub_0801A168
	bl sub_0802D4A0
	pop {r0}
	bx r0
	.align 2, 0
_0802C5EC: .4byte gUnknown_030040F0

