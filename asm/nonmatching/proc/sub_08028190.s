	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028190
sub_08028190: @ 0x08028190
	push {lr}
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0802819C
	bl sub_080196F4
_0802819C:
	pop {r0}
	bx r0

