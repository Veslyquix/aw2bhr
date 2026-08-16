	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032D38
sub_08032D38: @ 0x08032D38
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	bne _08032D48
	bl sub_08032A00
	bl sub_08032950
_08032D48:
	pop {r0}
	bx r0

