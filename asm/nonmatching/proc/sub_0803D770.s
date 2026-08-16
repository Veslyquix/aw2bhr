	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D770
sub_0803D770: @ 0x0803D770
	push {lr}
	ldr r0, _0803D784 @ =gUnknown_0849F330
	bl Proc_Find
	cmp r0, #0
	beq _0803D77E
	movs r0, #1
_0803D77E:
	pop {r1}
	bx r1
	.align 2, 0
_0803D784: .4byte gUnknown_0849F330

