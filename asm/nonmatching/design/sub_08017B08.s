	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017B08
sub_08017B08: @ 0x08017B08
	push {r4, r5, lr}
	ldr r5, _08017B44 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r0, r5, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r1, _08017B48 @ =sub_08017ABC
	str r1, [r0]
	bl sub_08034F7C
	ldr r0, _08017B4C @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	adds r5, #4
	adds r4, r4, r5
	ldr r1, [r4]
	ldr r1, [r1, #4]
	bl sub_080281D8
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08017B44: .4byte gUnknown_0200C528
_08017B48: .4byte sub_08017ABC
_08017B4C: .4byte gUnknown_03003FC0

