	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078180
sub_08078180: @ 0x08078180
	push {lr}
	ldr r0, _08078194 @ =gUnknown_08614894
	bl Proc_Find
	cmp r0, #0
	beq _0807818E
	movs r0, #1
_0807818E:
	pop {r1}
	bx r1
	.align 2, 0
_08078194: .4byte gUnknown_08614894

