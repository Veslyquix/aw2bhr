	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C7B4
sub_0801C7B4: @ 0x0801C7B4
	push {lr}
	ldr r0, _0801C7C8 @ =gUnknown_0848B5AC
	bl Proc_Find
	cmp r0, #0
	beq _0801C7C2
	movs r0, #1
_0801C7C2:
	pop {r1}
	bx r1
	.align 2, 0
_0801C7C8: .4byte gUnknown_0848B5AC

