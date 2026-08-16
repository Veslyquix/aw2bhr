	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801117C
sub_0801117C: @ 0x0801117C
	push {lr}
	ldr r3, _080111A4 @ =0x040000BA
	movs r1, #0
	strh r1, [r3]
	ldr r2, _080111A8 @ =0x040000B0
	ldr r1, [r0, #0x2c]
	str r1, [r2]
	adds r2, #4
	ldr r1, [r0, #0x30]
	str r1, [r2]
	adds r2, #4
	ldrh r1, [r0, #0x34]
	strh r1, [r2]
	ldrh r1, [r0, #0x36]
	strh r1, [r3]
	ldr r0, [r0, #0x38]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_080111A4: .4byte 0x040000BA
_080111A8: .4byte 0x040000B0

