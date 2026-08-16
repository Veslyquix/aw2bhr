	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078168
sub_08078168: @ 0x08078168
	push {lr}
	ldr r0, _0807817C @ =gUnknown_0861485C
	bl Proc_Find
	cmp r0, #0
	beq _08078176
	movs r0, #1
_08078176:
	pop {r1}
	bx r1
	.align 2, 0
_0807817C: .4byte gUnknown_0861485C

