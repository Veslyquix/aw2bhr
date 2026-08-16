	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E260
sub_0802E260: @ 0x0802E260
	push {lr}
	bl sub_08023824
	bl sub_08023518
	movs r0, #4
	bl sub_08023908
	bl sub_0802DBF8
	pop {r0}
	bx r0

