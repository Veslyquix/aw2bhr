	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018A64
sub_08018A64: @ 0x08018A64
	push {r4, lr}
	ldr r3, _08018AA0 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r3
	adds r4, r3, #4
	adds r4, r1, r4
	ldr r2, [r4]
	ldrh r2, [r2, #8]
	strb r2, [r0, #0x11]
	ldr r2, [r4]
	ldrh r2, [r2, #0xa]
	strh r2, [r0, #0x12]
	adds r3, #8
	adds r1, r1, r3
	ldr r2, _08018AA4 @ =sub_08018A28
	str r2, [r1]
	bl _call_via_r2
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018AA0: .4byte gUnknown_0200C528
_08018AA4: .4byte sub_08018A28

