	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067AD4
sub_08067AD4: @ 0x08067AD4
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _08067AE4
	adds r0, r1, #0
	bl Proc_Break
_08067AE4:
	pop {r0}
	bx r0

