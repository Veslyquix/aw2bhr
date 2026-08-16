	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011C18
sub_08011C18: @ 0x08011C18
	push {r4, r5, lr}
	ldr r1, _08011C50 @ =gUnknown_03002F30
	movs r0, #0
	strh r0, [r1]
	movs r2, #0
	ldr r4, _08011C54 @ =gUnknown_0200B3B4
	movs r3, #0
	adds r5, r4, #4
_08011C28:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r4
	str r3, [r1]
	adds r0, r0, r5
	str r3, [r0]
	ldrh r0, [r1, #8]
	strh r3, [r1, #8]
	ldrb r0, [r1, #0xa]
	strb r3, [r1, #0xa]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x2f
	bls _08011C28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011C50: .4byte gUnknown_03002F30
_08011C54: .4byte gUnknown_0200B3B4

