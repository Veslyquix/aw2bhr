	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CFC0
sub_0802CFC0: @ 0x0802CFC0
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _0802CFD6
	bl sub_0801A168
	bl sub_0802C280
_0802CFD6:
	pop {r0}
	bx r0
	.align 2, 0

