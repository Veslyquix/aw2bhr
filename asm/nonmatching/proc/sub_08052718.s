	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052718
sub_08052718: @ 0x08052718
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _080527A0 @ =gUnknown_0300453C
	strh r7, [r0]
	ldr r0, _080527A4 @ =gUnknown_0300451C
	mov r1, sb
	strh r1, [r0]
	mov r0, sb
	lsls r5, r0, #1
	ldr r0, _080527A8 @ =gUnknown_08553704
	ldr r1, _080527AC @ =gUnknown_0813610C
	mov r8, r1
	ldr r4, [r1]
	movs r1, #0x6c
	adds r6, r7, #0
	muls r6, r1, r6
	adds r1, r6, r4
	ldrh r3, [r1, #0x2e]
	lsls r3, r3, #2
	adds r3, r3, r6
	adds r1, r4, #0
	adds r1, #0x44
	adds r1, r3, r1
	ldr r2, [r1]
	adds r1, r4, #0
	adds r1, #0x58
	adds r3, r3, r1
	ldr r3, [r3]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl sub_08015410
	adds r5, r5, r6
	adds r4, #0x24
	adds r5, r5, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #1
	bl sub_08015504
	ldr r1, _080527B0 @ =gUnknown_03004580
	movs r2, #1
	adds r0, r7, #0
	eors r0, r2
	lsls r0, r0, #4
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r4, r8
	cmp r0, #0x14
	bne _080527B4
	adds r0, r7, #0
	movs r1, #0x23
	bl sub_080504A8
	b _080527BC
	.align 2, 0
_080527A0: .4byte gUnknown_0300453C
_080527A4: .4byte gUnknown_0300451C
_080527A8: .4byte gUnknown_08553704
_080527AC: .4byte gUnknown_0813610C
_080527B0: .4byte gUnknown_03004580
_080527B4:
	adds r0, r7, #0
	movs r1, #0x10
	bl sub_080504A8
_080527BC:
	ldr r1, _08052814 @ =gUnknown_08553B14
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r1, [r4]
	mov r0, sb
	lsls r4, r0, #1
	movs r0, #0x6c
	muls r0, r7, r0
	adds r4, r4, r0
	adds r1, #0x24
	adds r4, r4, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08016824
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08016944
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r5, #0
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_080157F4
	adds r0, r7, #0
	mov r1, sb
	bl sub_08052818
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052814: .4byte gUnknown_08553B14

