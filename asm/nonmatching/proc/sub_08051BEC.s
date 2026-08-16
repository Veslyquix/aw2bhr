	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08051BEC
sub_08051BEC: @ 0x08051BEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	str r7, [sp, #4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	mov r0, sb
	str r0, [sp, #8]
	ldr r1, _08051D40 @ =gUnknown_02028E5C
	lsls r2, r7, #2
	adds r1, r2, r1
	movs r3, #0
	movs r0, #1
	strh r0, [r1]
	ldr r0, _08051D44 @ =gUnknown_084C3F78
	adds r0, r2, r0
	ldr r0, [r0]
	strh r3, [r0]
	ldr r0, _08051D48 @ =gUnknown_0300453C
	strh r7, [r0]
	ldr r0, _08051D4C @ =gUnknown_0300451C
	mov r1, sb
	strh r1, [r0]
	ldr r1, _08051D50 @ =gUnknown_08552178
	mov r0, sb
	lsls r5, r0, #1
	adds r2, r2, r7
	mov sl, r2
	lsls r0, r2, #1
	adds r0, r5, r0
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	adds r4, #6
	ldr r0, _08051D54 @ =gUnknown_085536A4
	ldr r6, _08051D58 @ =gUnknown_02029808
	movs r1, #0x6c
	adds r2, r7, #0
	muls r2, r1, r2
	mov r8, r2
	adds r1, r2, r6
	ldrh r3, [r1, #0x2e]
	lsls r3, r3, #2
	add r3, r8
	adds r1, r6, #0
	adds r1, #0x44
	adds r1, r3, r1
	ldr r2, [r1]
	adds r1, r6, #0
	adds r1, #0x58
	adds r3, r3, r1
	ldr r3, [r3]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	add r5, r8
	adds r6, #0x24
	adds r5, r5, r6
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #1
	bl sub_08015504
	adds r0, r7, #0
	movs r1, #0x10
	bl sub_080504A8
	ldr r1, _08051D5C @ =gUnknown_08553B10
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	bl sub_08016824
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_08016944
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0xc0
	lsls r1, r1, #1
	bl sub_080157F4
	ldr r2, _08051D60 @ =gUnknown_02029A10
	mov r1, sb
	lsls r0, r1, #3
	add r0, sb
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r7, r1
	adds r0, r0, r1
	adds r6, r0, r2
	ldrb r0, [r6, #1]
	cmp r0, #1
	bne _08051D12
	strb r0, [r6]
	ldr r4, _08051D64 @ =gUnknown_08552FB8
	ldr r1, _08051D68 @ =gUnknown_03004580
	lsls r2, r7, #4
	adds r0, r1, #4
	adds r0, r2, r0
	ldrh r0, [r0]
	lsls r3, r0, #1
	adds r3, r3, r0
	ldr r5, _08051D6C @ =gUnknown_085D6A48
	adds r1, #2
	adds r2, r2, r1
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r4, #4
	adds r0, r0, r4
	ldr r3, [r0]
	adds r0, r7, #0
	mov r1, sb
	movs r2, #0
	bl _call_via_r3
_08051D12:
	ldr r0, _08051D70 @ =gUnknown_02029C14
	ldr r1, [sp, #8]
	add r1, sl
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	beq _08051D2E
	ldrb r0, [r6, #1]
	cmp r0, #0
	bne _08051D2E
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl sub_08051D74
_08051D2E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051D40: .4byte gUnknown_02028E5C
_08051D44: .4byte gUnknown_084C3F78
_08051D48: .4byte gUnknown_0300453C
_08051D4C: .4byte gUnknown_0300451C
_08051D50: .4byte gUnknown_08552178
_08051D54: .4byte gUnknown_085536A4
_08051D58: .4byte gUnknown_02029808
_08051D5C: .4byte gUnknown_08553B10
_08051D60: .4byte gUnknown_02029A10
_08051D64: .4byte gUnknown_08552FB8
_08051D68: .4byte gUnknown_03004580
_08051D6C: .4byte gUnknown_085D6A48
_08051D70: .4byte gUnknown_02029C14

