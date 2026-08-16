	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B9EC
sub_0803B9EC: @ 0x0803B9EC
	push {lr}
	ldr r0, _0803B9FC @ =gUnknown_0849EAAC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B9FC: .4byte gUnknown_0849EAAC

