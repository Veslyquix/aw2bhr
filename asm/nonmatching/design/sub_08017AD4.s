	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017AD4
sub_08017AD4: @ 0x08017AD4
	push {r4, lr}
	ldr r1, _08017B00 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r1, #4
	adds r4, r4, r1
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl sub_080206B0
	ldr r1, _08017B04 @ =gUnknown_03003FC0
	strb r0, [r1, #2]
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08017B00: .4byte gUnknown_0200C528
_08017B04: .4byte gUnknown_03003FC0

