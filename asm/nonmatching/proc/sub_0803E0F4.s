	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E0F4
sub_0803E0F4: @ 0x0803E0F4
	push {lr}
	bl sub_0803DE94
	cmp r0, #0
	beq _0803E102
	ldrb r0, [r0, #4]
	b _0803E104
_0803E102:
	movs r0, #0
_0803E104:
	pop {r1}
	bx r1

