	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080457A4
sub_080457A4: @ 0x080457A4
	push {lr}
	ldr r0, _080457B8 @ =gUnknown_084A0A3C
	bl Proc_Find
	cmp r0, #0
	beq _080457B2
	movs r0, #1
_080457B2:
	pop {r1}
	bx r1
	.align 2, 0
_080457B8: .4byte gUnknown_084A0A3C

