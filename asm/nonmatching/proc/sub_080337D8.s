	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080337D8
sub_080337D8: @ 0x080337D8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080337FC @ =gUnknown_0849BB28
	bl Proc_StartBlocking
	str r4, [r0, #0x20]
	str r5, [r0, #0x24]
	adds r2, r0, #0
	adds r2, #0x2f
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080337FC: .4byte gUnknown_0849BB28

