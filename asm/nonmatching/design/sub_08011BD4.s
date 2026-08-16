	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011BD4
sub_08011BD4: @ 0x08011BD4
	movs r2, #0
	ldr r1, _08011BE4 @ =gUnknown_03002F30
	ldrh r0, [r1]
	cmp r0, #0
	bne _08011BE8
	movs r0, #0
	b _08011C12
	.align 2, 0
_08011BE4: .4byte gUnknown_03002F30
_08011BE8:
	ldrh r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08011C0E
	ldr r3, _08011C14 @ =gUnknown_0200B3B4
_08011BF4:
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r1, [r1, #8]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	subs r0, #1
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08011BF4
_08011C0E:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
_08011C12:
	bx lr
	.align 2, 0
_08011C14: .4byte gUnknown_0200B3B4

