	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058E88
sub_08058E88: @ 0x08058E88
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r4, #0
	blt _08058F0C
	cmp r5, #0
	blt _08058F0C
	ldr r0, _08058F14 @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r0, [r3]
	cmp r4, r0
	bge _08058F0C
	ldrh r2, [r3, #2]
	cmp r5, r2
	bge _08058F0C
	lsls r1, r5, #1
	ldr r2, _08058F18 @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r6, r0, r4
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r6
	ldr r1, _08058F1C @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08058EC8
	cmp r0, #0
	bne _08058F0C
_08058EC8:
	ldr r0, _08058F20 @ =gUnknown_03003340
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08058F0C
	cmp r0, #0x79
	beq _08058F0C
	ldr r1, _08058F24 @ =gUnknown_085D5ABC
	ldr r0, _08058F28 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r2, [r0]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _08058F2C @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r6
	ldrb r2, [r0]
	movs r0, #0x1f
	ands r0, r2
	adds r1, #0x1a
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08058F0C
	strh r4, [r7]
	strh r5, [r7, #2]
_08058F0C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058F14: .4byte gUnknown_08499590
_08058F18: .4byte 0x0000417A
_08058F1C: .4byte gUnknown_03003F38
_08058F20: .4byte gUnknown_03003340
_08058F24: .4byte gUnknown_085D5ABC
_08058F28: .4byte gUnknown_030040D8
_08058F2C: .4byte 0x00001432

