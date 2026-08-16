	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E728
sub_0806E728: @ 0x0806E728
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E73C @ =gUnknown_08582BE4
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E73C: .4byte gUnknown_08582BE4

