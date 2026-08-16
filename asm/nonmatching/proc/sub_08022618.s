	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022618
sub_08022618: @ 0x08022618
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _080226A4 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	cmp r4, r0
	blo _08022636
	b _08022798
_08022636:
	ldrh r0, [r2, #0xc]
	subs r0, r5, r0
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	mov sl, r0
	ldrh r0, [r2, #0xe]
	subs r0, r4, r0
	ands r0, r1
	lsls r0, r0, #1
	mov sb, r0
	lsls r1, r4, #1
	ldr r3, _080226A8 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r0, r5
	ldr r3, _080226AC @ =0x0000051A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r0, #0
	beq _0802269A
	ldr r3, _080226B0 @ =0x0000234A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802269A
	lsls r6, r7, #0x10
	lsrs r0, r6, #0x10
	bl sub_0802571C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802269A
	asrs r1, r6, #0x10
	ldr r0, _080226B4 @ =gUnknown_08499594
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r1, [r2, #1]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080226B8
_0802269A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080225CC
	b _08022798
	.align 2, 0
_080226A4: .4byte gUnknown_08499590
_080226A8: .4byte 0x0000417A
_080226AC: .4byte 0x0000051A
_080226B0: .4byte 0x0000234A
_080226B4: .4byte gUnknown_08499594
_080226B8:
	mov r8, r2
	mov r0, sl
	lsls r4, r0, #0x10
	mov r1, sb
	lsls r5, r1, #0x10
	ldr r6, _08022754 @ =gUnknown_080909A8
	ldr r0, [r6]
	ldr r2, [r0]
	lsrs r1, r5, #0xa
	lsrs r0, r4, #0xf
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	movs r7, #0
	ldr r3, _08022758 @ =gUnknown_080909AC
	ldr r2, [r3]
	mov r0, r8
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r1, r0, r2
	ldrb r0, [r1, #0xb]
	mov sb, r4
	mov sl, r6
	adds r6, r3, #0
	cmp r0, #0
	beq _08022708
	mov r2, r8
	ldrh r4, [r2, #4]
	lsls r4, r4, #0x15
	lsrs r4, r4, #0x1c
	movs r1, #3
	bl Div
	cmp r4, r0
	bgt _08022708
	movs r7, #1
_08022708:
	ldr r2, [r6]
	mov r3, r8
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r2, r0, r2
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	beq _08022734
	ldrb r4, [r3, #6]
	lsls r4, r4, #0x19
	lsrs r4, r4, #0x19
	movs r1, #3
	bl Div
	cmp r4, r0
	bgt _08022734
	lsls r0, r7, #0x10
	movs r4, #0x80
	lsls r4, r4, #0xa
	adds r0, r0, r4
	lsrs r7, r0, #0x10
_08022734:
	lsls r0, r7, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	beq _08022760
	mov r1, sl
	ldr r0, [r1]
	ldr r2, [r0]
	lsrs r1, r5, #0xa
	mov r4, sb
	lsrs r0, r4, #0xf
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r2, _0802275C @ =0xFFFFA33C
	adds r0, r3, r2
	b _08022776
	.align 2, 0
_08022754: .4byte gUnknown_080909A8
_08022758: .4byte gUnknown_080909AC
_0802275C: .4byte 0xFFFFA33C
_08022760:
	mov r3, sl
	ldr r0, [r3]
	ldr r2, [r0]
	lsrs r1, r5, #0xa
	mov r4, sb
	lsrs r0, r4, #0xf
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r0, r2, #0
_08022776:
	strh r0, [r1, #2]
	mov r3, sl
	ldr r0, [r3]
	ldr r2, [r0]
	lsrs r1, r5, #0xa
	mov r4, sb
	lsrs r0, r4, #0xf
	adds r0, r0, r2
	adds r1, r1, r0
	adds r2, r1, #0
	adds r2, #0x42
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r0, r3, #0
	strh r0, [r2]
	adds r1, #0x40
	strh r0, [r1]
_08022798:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

