	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D8E8
sub_0803D8E8: @ 0x0803D8E8
	push {lr}
	ldr r0, [r0, #0x4c]
	cmp r0, #0
	beq _0803D8F4
	bl _call_via_r0
_0803D8F4:
	pop {r0}
	bx r0

