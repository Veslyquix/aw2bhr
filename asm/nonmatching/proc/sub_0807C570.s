	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C570
sub_0807C570: @ 0x0807C570
	push {lr}
	ldr r0, _0807C584 @ =gUnknown_086164A0
	bl Proc_Find
	cmp r0, #0
	beq _0807C57E
	movs r0, #1
_0807C57E:
	pop {r1}
	bx r1
	.align 2, 0
_0807C584: .4byte gUnknown_086164A0

