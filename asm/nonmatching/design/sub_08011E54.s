	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011E54
sub_08011E54: @ 0x08011E54
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r6, r2, #0
	ldr r0, _08011E74 @ =gUnknown_030044D0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08011E78
	adds r0, r3, #0
	bl sub_08011C68
	movs r0, #0
	b _08011EE8
	.align 2, 0
_08011E74: .4byte gUnknown_030044D0
_08011E78:
	ldr r4, _08011EDC @ =gUnknown_03002F30
	ldrh r0, [r4]
	cmp r0, #0x30
	beq _08011EE4
	ldr r2, _08011EE0 @ =gUnknown_0200B3B4
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	str r3, [r0]
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	str r5, [r0]
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #8]
	movs r3, #0
	strh r6, [r0, #8]
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0xa]
	strb r3, [r0, #0xa]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _08011EE8
	.align 2, 0
_08011EDC: .4byte gUnknown_03002F30
_08011EE0: .4byte gUnknown_0200B3B4
_08011EE4:
	movs r0, #1
	rsbs r0, r0, #0
_08011EE8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

