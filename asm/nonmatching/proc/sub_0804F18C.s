	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804F18C
sub_0804F18C: @ 0x0804F18C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0804F390 @ =gUnknown_081360A0
	mov sl, r0
	ldr r6, [r0]
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r3, _0804F394 @ =gUnknown_03001470
	movs r2, #0
	ldrsh r0, [r6, r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r3, #0
	adds r0, #0x28
	adds r1, r1, r0
	ldr r0, _0804F398 @ =gUnknown_081360A4
	mov sb, r0
	ldr r2, [r0]
	ldrh r0, [r2]
	lsls r0, r0, #3
	str r0, [r1]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x2c
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r1, _0804F39C @ =gUnknown_081360A8
	mov r8, r1
	ldr r5, [r1]
	ldrh r1, [r5]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x34
	adds r0, r0, r1
	ldrh r1, [r2]
	str r1, [r0]
	ldrh r0, [r5]
	movs r1, #1
	eors r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r4, #3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	ldr r2, _0804F3A0 @ =gUnknown_08551D0C
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r4, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldrh r1, [r5]
	lsls r1, r1, #8
	ldr r2, _0804F3A4 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _0804F3A8 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r1, _0804F3AC @ =gUnknown_0300454C
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	strh r0, [r1]
	movs r3, #0
	ldrsh r0, [r6, r3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldr r4, _0804F3B0 @ =gUnknown_085D6A48
	ldr r3, _0804F3B4 @ =gUnknown_03004580
	ldrh r2, [r5]
	lsls r2, r2, #4
	adds r0, r3, #2
	adds r0, r2, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r3, #6
	adds r2, r2, r3
	ldrh r1, [r2]
	bl sub_08057D44
	adds r7, r0, #0
	ldr r2, _0804F3B8 @ =gUnknown_085644E0
	ldr r0, _0804F3BC @ =gUnknown_0300450C
	ldrh r0, [r0]
	lsls r0, r0, #1
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r4, [r0]
	ldr r0, _0804F3C0 @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	mov r6, sb
	mov r5, r8
	cmp r0, #0
	beq _0804F2C2
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0804F2C2
	movs r4, #0
_0804F2C2:
	ldr r0, _0804F3C4 @ =gUnknown_02029A10
	mov sb, r0
	ldr r6, [r6]
	ldrh r3, [r6]
	lsls r1, r3, #3
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r5, [r5]
	ldrh r2, [r5]
	movs r0, #0xb4
	mov r8, r0
	mov r0, r8
	muls r0, r2, r0
	adds r1, r1, r0
	add r1, sb
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldrh r0, [r0]
	strh r0, [r1, #4]
	ldrh r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r5]
	mov r2, r8
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	add r0, sb
	ldrh r1, [r0, #4]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, r1
	strh r1, [r0, #8]
	ldrh r3, [r6]
	lsls r1, r3, #3
	adds r1, r1, r3
	lsls r1, r1, #2
	ldrh r2, [r5]
	mov r0, r8
	muls r0, r2, r0
	adds r1, r1, r0
	add r1, sb
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldrh r0, [r0, #2]
	strh r0, [r1, #6]
	ldrh r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r5]
	mov r3, r8
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	add r0, sb
	ldrh r1, [r0, #6]
	strh r1, [r0, #0xa]
	ldrh r0, [r5]
	ldrh r1, [r6]
	movs r2, #0
	movs r3, #0x32
	bl sub_0804BCB8
	mov r1, sl
	ldr r0, [r1]
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldrh r2, [r6]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r2, [r5]
	mov r3, r8
	muls r3, r2, r3
	adds r2, r3, #0
	adds r1, r1, r2
	add r1, sb
	ldrh r2, [r1, #8]
	adds r4, r4, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r3, #0xa
	ldrsh r2, [r1, r3]
	adds r1, r4, #0
	bl sub_080155C0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F390: .4byte gUnknown_081360A0
_0804F394: .4byte gUnknown_03001470
_0804F398: .4byte gUnknown_081360A4
_0804F39C: .4byte gUnknown_081360A8
_0804F3A0: .4byte gUnknown_08551D0C
_0804F3A4: .4byte 0x000003FF
_0804F3A8: .4byte 0xFFFFFC00
_0804F3AC: .4byte gUnknown_0300454C
_0804F3B0: .4byte gUnknown_085D6A48
_0804F3B4: .4byte gUnknown_03004580
_0804F3B8: .4byte gUnknown_085644E0
_0804F3BC: .4byte gUnknown_0300450C
_0804F3C0: .4byte gUnknown_03004504
_0804F3C4: .4byte gUnknown_02029A10

