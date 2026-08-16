	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011AAC
sub_08011AAC: @ 0x08011AAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _08011AD0 @ =gUnknown_030030E8
	ldrh r0, [r3]
	cmp r0, #0x10
	beq _08011AC8
	ldr r0, _08011AD4 @ =gUnknown_03002FA0
	ldrh r1, [r3]
	adds r2, r1, #1
	strh r2, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xe
	adds r1, r1, r0
	str r4, [r1]
_08011AC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011AD0: .4byte gUnknown_030030E8
_08011AD4: .4byte gUnknown_03002FA0

