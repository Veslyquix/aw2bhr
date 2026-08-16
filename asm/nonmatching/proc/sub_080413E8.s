	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080413E8
sub_080413E8: @ 0x080413E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl sub_0804138C
	movs r7, #0
	ldr r1, _08041488 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bge _080414FA
	mov r8, r1
_08041404:
	movs r6, #0
	mov r1, r8
	ldr r0, [r1]
	adds r4, r7, #1
	mov sb, r4
	ldrh r0, [r0]
	cmp r6, r0
	bge _080414EE
	ldr r0, _0804148C @ =gUnknown_020288B4
	mov sl, r0
_08041418:
	ldr r1, _08041490 @ =gUnknown_03003340
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080414E2
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0803DF54
	adds r2, r0, #0
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r7, #1
	ldr r4, _08041494 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r0, r6
	mov r4, sl
	adds r0, r1, r4
	ldrb r4, [r0]
	movs r5, #0
	cmp r2, #0
	beq _08041458
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x16
	lsrs r5, r0, #0x1c
_08041458:
	cmp r4, #0
	beq _0804145E
	movs r5, #6
_0804145E:
	cmp r5, #0
	beq _080414A4
	ldr r0, _08041498 @ =gUnknown_03003F38
	ldrb r0, [r0]
	movs r1, #0
	ldr r2, _0804149C @ =gUnknown_03003100
	bl sub_080251BC
	ldr r0, _080414A0 @ =gUnknown_030013D0
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080414E2
	adds r3, r5, #0
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_080413B4
	b _080414E2
	.align 2, 0
_08041488: .4byte gUnknown_08499590
_0804148C: .4byte gUnknown_020288B4
_08041490: .4byte gUnknown_03003340
_08041494: .4byte 0x0000417A
_08041498: .4byte gUnknown_03003F38
_0804149C: .4byte gUnknown_03003100
_080414A0: .4byte gUnknown_030013D0
_080414A4:
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _080414E2
	ldr r5, _0804150C @ =gUnknown_03003F38
	ldrb r0, [r5]
	adds r1, r4, #0
	bl sub_08026F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080414E2
	ldrb r0, [r5]
	adds r1, r4, #0
	ldr r2, _08041510 @ =gUnknown_03003100
	bl sub_080251BC
	ldr r0, _08041514 @ =gUnknown_030013D0
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080414E2
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_080413B4
_080414E2:
	adds r6, #1
	mov r4, r8
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r6, r0
	blt _08041418
_080414EE:
	mov r7, sb
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _08041404
_080414FA:
	ldr r0, _08041518 @ =gUnknown_030040A8
	ldr r0, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804150C: .4byte gUnknown_03003F38
_08041510: .4byte gUnknown_03003100
_08041514: .4byte gUnknown_030013D0
_08041518: .4byte gUnknown_030040A8

