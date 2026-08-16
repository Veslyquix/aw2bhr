	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080032EC
sub_080032EC: @ 0x080032EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	str r1, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r1, _08003344 @ =gUnknown_0808D760
	add r0, sp, #4
	movs r2, #8
	bl sub_0808B6E8
	add r5, sp, #0xc
	ldr r1, _08003348 @ =gUnknown_0808D768
	adds r0, r5, #0
	movs r2, #4
	bl sub_0808B6E8
	add r4, sp, #0x10
	ldr r1, _0800334C @ =gUnknown_0808D76C
	adds r0, r4, #0
	movs r2, #4
	bl sub_0808B6E8
	ldr r1, _08003350 @ =gUnknown_0808D770
	ldr r0, [r1]
	mov sb, r0
	ldr r7, [r0]
	adds r0, r7, #0
	adds r0, #0x76
	add r0, r8
	mov ip, r0
	ldrb r6, [r0]
	adds r5, r1, #0
	cmp r6, #0xa
	beq _08003396
	cmp r6, #0xa
	bgt _08003354
	cmp r6, #0
	beq _0800335E
	b _08003466
	.align 2, 0
_08003344: .4byte gUnknown_0808D760
_08003348: .4byte gUnknown_0808D768
_0800334C: .4byte gUnknown_0808D76C
_08003350: .4byte gUnknown_0808D770
_08003354:
	cmp r6, #0x14
	beq _080033E6
	cmp r6, #0x1e
	beq _08003424
	b _08003466
_0800335E:
	mov r1, r8
	lsls r4, r1, #1
	mov r0, sp
	adds r0, r0, r4
	adds r0, #4
	ldrh r0, [r0]
	add r1, sp, #0x14
	add r2, sp, #0x18
	bl sub_0800C6E8
	cmp r0, #0
	beq _08003466
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x76
	add r0, r8
	movs r1, #0xa
	strb r1, [r0]
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x8a
	adds r0, r0, r4
	movs r2, #5
	strh r2, [r0]
	adds r1, #0x92
	adds r1, r1, r4
	strh r6, [r1]
	b _08003466
_08003396:
	mov r4, r8
	lsls r3, r4, #1
	adds r0, r7, #0
	adds r0, #0x92
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r1, #0
	subs r2, #0x20
	cmp r2, #0
	bge _080033B2
	movs r4, #0xa4
	lsls r4, r4, #1
	adds r2, r1, r4
_080033B2:
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #0x8a
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r0, #0
	adds r2, #0xa
	cmp r2, #0xff
	ble _080033DC
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0x14
	mov r4, ip
	strb r0, [r4]
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0x92
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0]
_080033DC:
	mov r4, sb
	ldr r0, [r4]
	adds r0, #0x8a
	adds r0, r0, r3
	b _08003464
_080033E6:
	mov r0, r8
	lsls r4, r0, #1
	mov r0, sp
	adds r0, r0, r4
	adds r0, #4
	ldrh r0, [r0]
	add r1, sp, #0x14
	add r2, sp, #0x18
	bl sub_0800C6E8
	adds r2, r0, #0
	cmp r2, #0
	bne _08003466
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0x76
	add r0, r8
	movs r1, #0x1e
	strb r1, [r0]
	mov r3, sb
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0x92
	adds r0, r0, r4
	strh r2, [r0]
	adds r1, #0x8a
	adds r1, r1, r4
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	b _08003466
_08003424:
	mov r4, r8
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x92
	adds r0, r0, r1
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r2, r3, #0
	subs r2, #0x20
	cmp r2, #0
	bge _08003440
	movs r4, #0xa4
	lsls r4, r4, #1
	adds r2, r3, r4
_08003440:
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #0x8a
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r0, #0
	subs r2, #0x20
	cmp r2, #0
	bgt _0800345C
	movs r2, #1
	movs r0, #0
	mov r3, ip
	strb r0, [r3]
_0800345C:
	mov r4, sb
	ldr r0, [r4]
	adds r0, #0x8a
	adds r0, r0, r1
_08003464:
	strh r2, [r0]
_08003466:
	ldr r5, [r5]
	mov sb, r5
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x76
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800347A
	b _080035AE
_0800347A:
	ldr r5, _080035C0 @ =gSinLut
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r2, #0
	adds r0, #0x92
	adds r0, r0, r1
	movs r7, #0xff
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r6, r0, #4
	adds r0, r2, #0
	adds r0, #0x8a
	adds r2, r0, r1
	movs r4, #0
	ldrsh r0, [r2, r4]
	movs r3, #2
	adds r4, r1, #0
	cmp r0, #0
	beq _080034AA
	adds r3, r0, #0
_080034AA:
	adds r0, r6, #0
	adds r1, r3, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x24]
	mov r1, sb
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0x92
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	rsbs r0, r0, #0
	lsls r3, r0, #4
	adds r2, #0x8a
	adds r2, r2, r4
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #2
	cmp r0, #0
	beq _080034E4
	adds r1, r0, #0
_080034E4:
	adds r0, r3, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	mov r1, sb
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0x92
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r3, r0, #4
	adds r2, #0x8a
	adds r2, r2, r4
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #2
	cmp r0, #0
	beq _0800351A
	adds r1, r0, #0
_0800351A:
	adds r0, r3, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	mov r1, sb
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0x92
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r3, r0, #4
	adds r2, #0x8a
	adds r1, r2, r4
	movs r4, #0
	ldrsh r0, [r1, r4]
	movs r2, #2
	cmp r0, #0
	beq _08003550
	adds r2, r0, #0
_08003550:
	adds r0, r3, #0
	adds r1, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r4, r8
	adds r4, #1
	str r0, [sp]
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	mov r2, sl
	adds r3, r6, #0
	bl SetObjAffine
	movs r3, #0xc0
	lsls r3, r3, #2
	mov r0, r8
	adds r0, #0x3e
	mov r1, sp
	add r1, r8
	adds r1, #0xc
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #0x1c]
	adds r1, r2, r1
	subs r1, #7
	ldr r2, _080035C4 @ =0x000001FF
	ands r1, r2
	lsls r4, r4, #9
	orrs r1, r4
	mov r2, sp
	add r2, r8
	adds r2, #0x10
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r4, [sp, #0x20]
	adds r2, r4, r2
	subs r2, #6
	ands r2, r7
	orrs r2, r3
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
_080035AE:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080035C0: .4byte gSinLut
_080035C4: .4byte 0x000001FF

