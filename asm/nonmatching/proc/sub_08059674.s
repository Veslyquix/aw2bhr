	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059674
sub_08059674: @ 0x08059674
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r4, _0805970C @ =gUnknown_0816D968
	ldr r2, [r4]
	ldr r3, [r2]
	lsrs r7, r1, #0x10
	asrs r1, r1, #0xf
	ldr r5, _08059710 @ =0x0000417A
	adds r2, r3, r5
	adds r2, r2, r1
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r2]
	adds r0, r0, r2
	adds r3, #0x12
	adds r3, r3, r0
	ldr r0, _08059714 @ =gUnknown_03003F38
	ldrb r1, [r3]
	ldrb r0, [r0]
	cmp r1, r0
	beq _080596A4
	cmp r1, #0
	bne _08059758
_080596A4:
	lsls r0, r5, #0x10
	asrs r6, r0, #0x10
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0805C988
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059758
	ldr r3, _08059718 @ =gUnknown_085767D5
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r4, _08059710 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _0805971C @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r4, #0x1f
	ands r4, r1
	adds r3, r4, r3
	ldrb r0, [r3]
	cmp r0, #0
	beq _08059746
	movs r2, #0xe0
	ands r2, r1
	ldr r0, _08059720 @ =gUnknown_03004084
	ldrh r0, [r0]
	cmp r2, r0
	beq _08059728
	cmp r2, #0
	beq _08059758
	ldr r0, _08059724 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #2
	bls _08059746
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0805A8C0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08059746
	b _08059758
	.align 2, 0
_0805970C: .4byte gUnknown_0816D968
_08059710: .4byte 0x0000417A
_08059714: .4byte gUnknown_03003F38
_08059718: .4byte gUnknown_085767D5
_0805971C: .4byte 0x00001432
_08059720: .4byte gUnknown_03004084
_08059724: .4byte gUnknown_030040D8
_08059728:
	ldr r0, _0805974C @ =gUnknown_085767B8
	adds r0, r4, r0
	ldrb r3, [r0]
	cmp r3, #0
	beq _08059746
	ldr r0, _08059750 @ =gUnknown_030046AC
	ldrb r0, [r0]
	cmp r3, r0
	beq _08059746
	ldr r0, _08059754 @ =gUnknown_030045CC
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059758
_08059746:
	movs r0, #1
	b _0805975A
	.align 2, 0
_0805974C: .4byte gUnknown_085767B8
_08059750: .4byte gUnknown_030046AC
_08059754: .4byte gUnknown_030045CC
_08059758:
	movs r0, #0
_0805975A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

