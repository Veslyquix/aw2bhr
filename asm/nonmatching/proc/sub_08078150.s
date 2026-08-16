	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078150
sub_08078150: @ 0x08078150
	push {lr}
	ldr r0, _08078164 @ =gUnknown_086147FC
	bl Proc_Find
	cmp r0, #0
	beq _0807815E
	movs r0, #1
_0807815E:
	pop {r1}
	bx r1
	.align 2, 0
_08078164: .4byte gUnknown_086147FC

