	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F3E4
sub_0803F3E4: @ 0x0803F3E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0803F3FC @ =gUnknown_0849F918
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F3FC: .4byte gUnknown_0849F918

