	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002510
sub_08002510: @ 0x08002510
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	movs r0, #0xff
	ands r5, r0
	ldr r0, _08002538 @ =gUnknown_0808D714
	ldr r4, [r0]
	ldr r2, [r4]
	adds r3, r2, #0
	adds r3, #0x5a
	ldrb r1, [r3]
	adds r6, r0, #0
	cmp r1, #0xa
	beq _08002570
	cmp r1, #0xa
	bgt _0800253C
	cmp r1, #0
	beq _08002546
	b _08002602
	.align 2, 0
_08002538: .4byte gUnknown_0808D714
_0800253C:
	cmp r1, #0x14
	beq _08002598
	cmp r1, #0x1e
	beq _080025BC
	b _08002602
_08002546:
	bl sub_0800C9E8
	cmp r0, #0
	bne _08002550
	b _08002718
_08002550:
	ldr r1, [r4]
	movs r2, #0x3e
	ldrsh r0, [r1, r2]
	movs r2, #0x32
	cmp r0, #0
	beq _0800255E
	movs r2, #0xa
_0800255E:
	adds r0, r1, #0
	adds r0, #0x5a
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, #0x5c
	movs r1, #0x8c
	lsls r1, r1, #5
	strh r1, [r0]
	b _08002602
_08002570:
	adds r2, #0x5c
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0xb4
	lsls r0, r0, #4
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xd6
	lsls r1, r1, #4
	cmp r0, r1
	bgt _08002602
	strh r1, [r2]
	movs r0, #0x14
	strb r0, [r3]
	b _08002602
_08002598:
	bl sub_0800C9E8
	cmp r0, #0
	beq _080025B0
	ldr r1, [r4]
	movs r2, #0x3e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080025B0
	ldrh r0, [r1, #4]
	cmp r0, #1
	beq _08002602
_080025B0:
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x5a
	movs r1, #0x1e
	strb r1, [r0]
	b _08002602
_080025BC:
	adds r2, #0x5c
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x95
	lsls r1, r1, #5
	subs r1, r1, r0
	asrs r1, r1, #3
	ldrh r0, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	lsls r1, r1, #0x10
	ldr r0, _08002620 @ =0x10DF0000
	cmp r1, r0
	ble _08002602
	movs r0, #0x87
	lsls r0, r0, #5
	strh r0, [r2]
	bl sub_0800C9E8
	cmp r0, #0
	bne _080025E8
	b _08002718
_080025E8:
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _08002602
	movs r2, #0x3e
	ldrsh r0, [r1, r2]
	movs r2, #0
	cmp r0, #0
	bne _080025FC
	movs r2, #0x32
_080025FC:
	adds r0, r1, #0
	adds r0, #0x5a
	strb r2, [r0]
_08002602:
	ldr r4, [r6]
	ldr r1, [r4]
	adds r3, r1, #0
	adds r3, #0x5a
	ldrb r0, [r3]
	cmp r0, #0x46
	beq _08002684
	cmp r0, #0x46
	bgt _08002624
	cmp r0, #0x32
	beq _0800262A
	cmp r0, #0x3c
	beq _08002654
	b _080026EA
	.align 2, 0
_08002620: .4byte 0x10DF0000
_08002624:
	cmp r0, #0x50
	beq _080026A8
	b _080026EA
_0800262A:
	bl sub_0800C9E8
	cmp r0, #0
	beq _08002718
	ldr r1, [r4]
	movs r2, #0x3e
	ldrsh r0, [r1, r2]
	movs r2, #0
	cmp r0, #0
	bne _08002640
	movs r2, #0x3c
_08002640:
	adds r0, r1, #0
	adds r0, #0x5a
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, #0x5c
	ldr r1, _08002650 @ =0x0000FD80
	strh r1, [r0]
	b _080026EA
	.align 2, 0
_08002650: .4byte 0x0000FD80
_08002654:
	adds r2, r1, #0
	adds r2, #0x5c
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r1, r1, #3
	ldrh r0, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	lsls r1, r1, #0x10
	ldr r0, _08002680 @ =0x019F0000
	cmp r1, r0
	ble _080026EA
	movs r0, #0xd0
	lsls r0, r0, #1
	strh r0, [r2]
	movs r0, #0x46
	strb r0, [r3]
	b _080026EA
	.align 2, 0
_08002680: .4byte 0x019F0000
_08002684:
	bl sub_0800C9E8
	cmp r0, #0
	beq _0800269C
	ldr r1, [r4]
	movs r2, #0x3e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0800269C
	ldrh r0, [r1, #4]
	cmp r0, #1
	beq _080026EA
_0800269C:
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x5a
	movs r1, #0x50
	strb r1, [r0]
	b _080026EA
_080026A8:
	adds r2, r1, #0
	adds r2, #0x5c
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, _08002720 @ =0xFFFFFC60
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08002724 @ =0xFFFFFE20
	cmp r0, r1
	bgt _080026EA
	strh r1, [r2]
	bl sub_0800C9E8
	cmp r0, #0
	beq _08002718
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _080026EA
	movs r2, #0x3e
	ldrsh r0, [r1, r2]
	movs r2, #0
	cmp r0, #0
	bne _080026E4
	movs r2, #0x32
_080026E4:
	adds r0, r1, #0
	adds r0, #0x5a
	strb r2, [r0]
_080026EA:
	ldr r4, [r6]
	ldr r0, [r4]
	adds r0, #0x5c
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r1, #0x18
	ldr r0, _08002728 @ =0x000001FF
	ands r1, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x8f
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801F34C
	ldr r2, [r4]
	adds r2, #0x5b
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r2]
_08002718:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002720: .4byte 0xFFFFFC60
_08002724: .4byte 0xFFFFFE20
_08002728: .4byte 0x000001FF

