	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804209C
sub_0804209C: @ 0x0804209C
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08042126
	ldr r0, _0804212C @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r3, r0
	bge _08042126
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _08042126
	ldrh r1, [r2, #2]
	cmp r0, r1
	bge _08042126
	lsls r1, r0, #1
	ldr r4, _08042130 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r3
	ldr r3, _08042134 @ =0x0000051A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r2, [r0]
	cmp r2, #0
	beq _08042126
	movs r0, #0xc0
	ands r0, r2
	ldr r1, _08042138 @ =gUnknown_03003F2C
	ldrh r1, [r1]
	cmp r0, r1
	bne _08042126
	ldr r1, _0804213C @ =gUnknown_08499594
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r2, r1, r0
	ldr r0, _08042140 @ =gUnknown_030040D8
	ldr r0, [r0]
	cmp r2, r0
	beq _08042126
	ldr r0, _08042144 @ =gUnknown_084995A8
	ldrb r3, [r2]
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08042126
	ldr r1, _08042148 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	muls r0, r3, r0
	adds r3, r0, r1
	ldrh r0, [r2, #4]
	lsls r0, r0, #0x15
	ldrb r1, [r3, #0xb]
	lsrs r0, r0, #0x1c
	cmp r1, r0
	bne _0804214C
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x19
	ldrb r1, [r3, #0x10]
	lsrs r0, r0, #0x19
	cmp r1, r0
	bne _0804214C
_08042126:
	movs r0, #0
	b _0804214E
	.align 2, 0
_0804212C: .4byte gUnknown_08499590
_08042130: .4byte 0x0000417A
_08042134: .4byte 0x0000051A
_08042138: .4byte gUnknown_03003F2C
_0804213C: .4byte gUnknown_08499594
_08042140: .4byte gUnknown_030040D8
_08042144: .4byte gUnknown_084995A8
_08042148: .4byte gUnknown_085D5ABC
_0804214C:
	movs r0, #1
_0804214E:
	pop {r4}
	pop {r1}
	bx r1

