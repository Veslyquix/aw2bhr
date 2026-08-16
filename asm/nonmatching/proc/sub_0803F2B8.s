	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F2B8
sub_0803F2B8: @ 0x0803F2B8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0803F2D4 @ =gUnknown_0849F888
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x4c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F2D4: .4byte gUnknown_0849F888

