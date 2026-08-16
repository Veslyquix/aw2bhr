	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B6E8
sub_0803B6E8: @ 0x0803B6E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803B6FC @ =gUnknown_0849E778
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B6FC: .4byte gUnknown_0849E778

