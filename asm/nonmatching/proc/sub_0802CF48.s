	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CF48
sub_0802CF48: @ 0x0802CF48
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _0802CF66
	bl sub_0801A614
	bl sub_0801A168
	bl sub_08034F10
	bl sub_080485AC
_0802CF66:
	pop {r0}
	bx r0
	.align 2, 0

