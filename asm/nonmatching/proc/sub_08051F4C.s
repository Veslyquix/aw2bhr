	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08051F4C
sub_08051F4C: @ 0x08051F4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	str r7, [sp, #4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	mov sl, sb
	ldr r2, _0805204C @ =gUnknown_02028E5C
	lsls r1, r7, #2
	adds r2, r1, r2
	movs r3, #0
	movs r0, #1
	strh r0, [r2]
	ldr r0, _08052050 @ =gUnknown_084C3F78
	adds r0, r1, r0
	ldr r0, [r0]
	strh r3, [r0]
	ldr r0, _08052054 @ =gUnknown_0300453C
	strh r7, [r0]
	ldr r0, _08052058 @ =gUnknown_0300451C
	mov r2, sb
	strh r2, [r0]
	ldr r0, _0805205C @ =gUnknown_08552178
	mov r2, sb
	lsls r6, r2, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r6, r1
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r4, r0, #3
	subs r4, r4, r0
	adds r4, #6
	ldr r0, _08052060 @ =gUnknown_085536BC
	ldr r5, _08052064 @ =gUnknown_02029808
	movs r1, #0x6c
	adds r2, r7, #0
	muls r2, r1, r2
	mov r8, r2
	adds r1, r2, r5
	ldrh r3, [r1, #0x2e]
	lsls r3, r3, #2
	add r3, r8
	adds r1, r5, #0
	adds r1, #0x44
	adds r1, r3, r1
	ldr r2, [r1]
	adds r1, r5, #0
	adds r1, #0x58
	adds r3, r3, r1
	ldr r3, [r3]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	add r6, r8
	adds r5, #0x24
	adds r6, r6, r5
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r6]
	adds r0, r7, #0
	movs r1, #0x10
	bl sub_080504A8
	ldr r0, _08052068 @ =gUnknown_08553B14
	lsls r5, r7, #1
	adds r0, r5, r0
	ldrh r4, [r0]
	movs r1, #0
	ldrsh r0, [r6, r1]
	bl sub_08016824
	movs r2, #0
	ldrsh r0, [r6, r2]
	bl sub_08016944
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_080157A4
	movs r2, #0
	ldrsh r0, [r6, r2]
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_080157F4
	ldr r2, _0805206C @ =gUnknown_085D6A48
	ldr r4, _08052070 @ =gUnknown_03004580
	lsls r3, r7, #4
	adds r0, r4, #2
	adds r0, r3, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	cmp r0, #1
	bne _08052078
	ldr r0, _08052074 @ =gUnknown_08552148
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp sb, r0
	bne _080520A8
	adds r0, r4, #0
	adds r0, #0xc
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne _080520A8
	adds r0, r7, #0
	mov r1, sb
	bl sub_08051D74
	b _080520A8
	.align 2, 0
_0805204C: .4byte gUnknown_02028E5C
_08052050: .4byte gUnknown_084C3F78
_08052054: .4byte gUnknown_0300453C
_08052058: .4byte gUnknown_0300451C
_0805205C: .4byte gUnknown_08552178
_08052060: .4byte gUnknown_085536BC
_08052064: .4byte gUnknown_02029808
_08052068: .4byte gUnknown_08553B14
_0805206C: .4byte gUnknown_085D6A48
_08052070: .4byte gUnknown_03004580
_08052074: .4byte gUnknown_08552148
_08052078:
	ldr r2, _08052098 @ =gUnknown_02029A10
	mov r1, sb
	lsls r0, r1, #3
	add r0, sb
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r0, r2
	ldrb r0, [r1, #1]
	cmp r0, #1
	bne _0805209C
	movs r0, #1
	strb r0, [r1]
	b _080520A8
	.align 2, 0
_08052098: .4byte gUnknown_02029A10
_0805209C:
	cmp r0, #0
	bne _080520A8
	ldr r0, [sp, #4]
	mov r1, sl
	bl sub_08051D74
_080520A8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

