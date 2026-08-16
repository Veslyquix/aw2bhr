	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074714
sub_08074714: @ 0x08074714
	push {lr}
	adds r1, r0, #0
	ldr r0, _08074728 @ =gUnknown_086142B4
	bl Proc_Start
	movs r1, #0xc0
	lsls r1, r1, #4
	str r1, [r0, #0x58]
	pop {r0}
	bx r0
	.align 2, 0
_08074728: .4byte gUnknown_086142B4

