	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011D10
sub_08011D10: @ 0x08011D10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r3, _08011D68 @ =gUnknown_03002F30
	ldrh r0, [r3]
	cmp r0, #0x30
	beq _08011D70
	ldr r2, _08011D6C @ =gUnknown_0200B3B4
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
	ldrb r1, [r0, #0xa]
	movs r1, #3
	strb r1, [r0, #0xa]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	ldrh r0, [r3]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _08011D74
	.align 2, 0
_08011D68: .4byte gUnknown_03002F30
_08011D6C: .4byte gUnknown_0200B3B4
_08011D70:
	movs r0, #1
	rsbs r0, r0, #0
_08011D74:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

