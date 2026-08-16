	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057BDC
sub_08057BDC: @ 0x08057BDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _08057C50 @ =gUnknown_03004508
	ldrh r0, [r1]
	cmp r0, #8
	bhi _08057C9A
	ldr r0, _08057C54 @ =gUnknown_08553B04
	ldrh r1, [r1]
	adds r1, r1, r0
	movs r4, #0
	ldrsb r4, [r1, r4]
	movs r7, #0
	ldr r0, _08057C58 @ =gUnknown_08499578
	mov sl, r0
	ldr r1, _08057C5C @ =gUnknown_08551A04
	mov sb, r1
	ldr r0, _08057C60 @ =gUnknown_03004580
	adds r0, #2
	mov r8, r0
_08057C08:
	mov r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, _08057C64 @ =gUnknown_085D6A48
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	adds r5, r0, r7
	ldr r1, _08057C68 @ =gUnknown_08553A18
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r6, r0, r1
	cmp r7, #0
	beq _08057C6C
	lsls r1, r7, #9
	mov r2, sl
	ldr r0, [r2]
	adds r0, r0, r1
	ldrh r2, [r6, #2]
	lsls r2, r2, #5
	ldrh r1, [r6]
	adds r1, #0xe
	subs r1, r1, r4
	adds r2, r2, r1
	lsls r2, r2, #1
	mov r3, sb
	ldr r1, [r3]
	adds r1, r1, r2
	adds r2, r4, #0
	movs r3, #6
	bl sub_08071900
	b _08057C90
	.align 2, 0
_08057C50: .4byte gUnknown_03004508
_08057C54: .4byte gUnknown_08553B04
_08057C58: .4byte gUnknown_08499578
_08057C5C: .4byte gUnknown_08551A04
_08057C60: .4byte gUnknown_03004580
_08057C64: .4byte gUnknown_085D6A48
_08057C68: .4byte gUnknown_08553A18
_08057C6C:
	movs r1, #0xe
	subs r1, r1, r4
	lsls r1, r1, #1
	mov r2, sl
	ldr r0, [r2]
	adds r0, r0, r1
	ldrh r2, [r6, #2]
	lsls r2, r2, #5
	ldrh r6, [r6]
	adds r2, r2, r6
	lsls r2, r2, #1
	mov r3, sb
	ldr r1, [r3]
	adds r1, r1, r2
	adds r2, r4, #0
	movs r3, #6
	bl sub_08071900
_08057C90:
	movs r0, #0x10
	add r8, r0
	adds r7, #1
	cmp r7, #1
	ble _08057C08
_08057C9A:
	movs r7, #0
	ldr r1, _08057D20 @ =gUnknown_085D6A48
	mov sb, r1
	ldr r2, _08057D24 @ =gUnknown_03004582
	mov r8, r2
_08057CA4:
	ldr r0, _08057D28 @ =gUnknown_030005E8
	lsls r1, r7, #1
	adds r0, r1, r0
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _08057D0C
	ldr r0, _08057D2C @ =gUnknown_02029B78
	adds r3, r1, r0
	ldr r0, _08057D30 @ =gUnknown_02029B7C
	adds r0, r1, r0
	ldrh r1, [r3]
	ldrh r0, [r0]
	cmp r1, r0
	beq _08057D0C
	ldr r2, _08057D34 @ =gUnknown_030005D8
	lsls r1, r7, #2
	adds r2, r1, r2
	ldr r0, _08057D38 @ =gUnknown_030005E0
	adds r1, r1, r0
	ldr r0, [r2]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r3]
	lsls r0, r7, #4
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sb
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	adds r5, r0, r7
	ldr r1, _08057D3C @ =gUnknown_08553A18
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r6, r0, r1
	ldr r4, _08057D40 @ =gUnknown_08551A04
	ldr r0, [r4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0805772C
	ldr r0, [r4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080577E4
_08057D0C:
	adds r7, #1
	cmp r7, #1
	ble _08057CA4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057D20: .4byte gUnknown_085D6A48
_08057D24: .4byte gUnknown_03004582
_08057D28: .4byte gUnknown_030005E8
_08057D2C: .4byte gUnknown_02029B78
_08057D30: .4byte gUnknown_02029B7C
_08057D34: .4byte gUnknown_030005D8
_08057D38: .4byte gUnknown_030005E0
_08057D3C: .4byte gUnknown_08553A18
_08057D40: .4byte gUnknown_08551A04

