	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011EF0
sub_08011EF0: @ 0x08011EF0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r3, _08011F5C @ =gUnknown_03002F30
	ldrh r0, [r3]
	cmp r0, #0x30
	beq _08011F64
	ldr r2, _08011F60 @ =gUnknown_0200B3B4
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	str r4, [r0]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	str r5, [r0]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #8]
	strh r6, [r0, #8]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0xa]
	movs r1, #1
	strb r1, [r0, #0xa]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	ldrh r0, [r3]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _08011F68
	.align 2, 0
_08011F5C: .4byte gUnknown_03002F30
_08011F60: .4byte gUnknown_0200B3B4
_08011F64:
	movs r0, #1
	rsbs r0, r0, #0
_08011F68:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

