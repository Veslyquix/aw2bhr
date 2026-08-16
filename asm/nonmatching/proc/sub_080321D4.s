	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080321D4
sub_080321D4: @ 0x080321D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803BD6C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080321EA
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080321EA:
	pop {r4}
	pop {r0}
	bx r0

