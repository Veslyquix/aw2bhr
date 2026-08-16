	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B628
sub_0803B628: @ 0x0803B628
	push {lr}
	ldr r0, _0803B63C @ =gUnknown_0849E750
	bl Proc_Find
	cmp r0, #0
	beq _0803B636
	movs r0, #1
_0803B636:
	pop {r1}
	bx r1
	.align 2, 0
_0803B63C: .4byte gUnknown_0849E750

