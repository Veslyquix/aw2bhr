	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805ACFC
sub_0805ACFC: @ 0x0805ACFC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	cmp r4, #0
	blt _0805AD70
	cmp r5, #0
	blt _0805AD70
	ldr r0, _0805AD78 @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r0, [r3]
	cmp r4, r0
	bge _0805AD70
	ldrh r1, [r3, #2]
	cmp r5, r1
	bge _0805AD70
	lsls r1, r5, #1
	ldr r2, _0805AD7C @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, r4
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r2
	ldr r1, _0805AD80 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0805AD3C
	cmp r0, #0
	bne _0805AD70
_0805AD3C:
	ldr r0, _0805AD84 @ =gUnknown_03003340
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805AD70
	cmp r0, #0x78
	beq _0805AD70
	cmp r0, #0x79
	beq _0805AD70
	ldr r1, _0805AD88 @ =0x00001432
	adds r0, r3, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0xd
	beq _0805AD6C
	cmp r1, #0xb
	bne _0805AD70
_0805AD6C:
	strh r4, [r6]
	strh r5, [r6, #2]
_0805AD70:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AD78: .4byte gUnknown_08499590
_0805AD7C: .4byte 0x0000417A
_0805AD80: .4byte gUnknown_03003F38
_0805AD84: .4byte gUnknown_03003340
_0805AD88: .4byte 0x00001432

