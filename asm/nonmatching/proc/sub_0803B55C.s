	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B55C
sub_0803B55C: @ 0x0803B55C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803B574 @ =gUnknown_0849E728
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B574: .4byte gUnknown_0849E728

