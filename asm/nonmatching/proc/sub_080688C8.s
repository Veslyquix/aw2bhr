	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080688C8
sub_080688C8: @ 0x080688C8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080688D8
	subs r0, #1
	str r0, [r1, #0x2c]
	b _080688DE
_080688D8:
	adds r0, r1, #0
	bl Proc_Break
_080688DE:
	pop {r0}
	bx r0
	.align 2, 0

