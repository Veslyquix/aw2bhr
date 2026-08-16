	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080723C0
sub_080723C0: @ 0x080723C0
	push {lr}
	ldr r0, _080723D8 @ =gUnknown_08613EE4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080723D2
	movs r0, #0
	str r0, [r1, #0x4c]
_080723D2:
	pop {r0}
	bx r0
	.align 2, 0
_080723D8: .4byte gUnknown_08613EE4

