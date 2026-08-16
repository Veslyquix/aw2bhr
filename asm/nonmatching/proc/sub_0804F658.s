	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804F658
sub_0804F658: @ 0x0804F658
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r6, _0804F880 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r3, _0804F884 @ =gUnknown_03001470
	movs r2, #0
	ldrsh r0, [r6, r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r3, #0
	adds r0, #0x28
	adds r1, r1, r0
	ldr r0, _0804F888 @ =gUnknown_081360B8
	mov sl, r0
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
	adds r1, #0x30
	adds r0, r0, r1
	ldr r1, _0804F88C @ =gUnknown_081360BC
	mov sb, r1
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
	ldrh r3, [r5]
	movs r1, #1
	eors r1, r3
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r4, #3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	ldr r2, _0804F890 @ =gUnknown_08551D0C
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
	ldr r2, _0804F894 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _0804F898 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r1, _0804F89C @ =gUnknown_085523A4
	ldr r0, _0804F8A0 @ =gUnknown_0300450C
	mov r8, r0
	ldrh r0, [r0]
	eors r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0xf
	adds r3, r3, r1
	ldrh r1, [r3]
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldr r4, _0804F8A4 @ =gUnknown_085D6A48
	ldr r6, _0804F8A8 @ =gUnknown_081360C0
	ldr r3, [r6]
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
	mov ip, r0
	ldr r2, _0804F8AC @ =gUnknown_085644E0
	mov r3, r8
	ldrh r0, [r3]
	lsls r0, r0, #1
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r7, [r0]
	ldr r0, _0804F8B0 @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	mov r2, sl
	mov r3, sb
	adds r5, r6, #0
	cmp r0, #0
	beq _0804F788
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0804F788
	movs r7, #0
_0804F788:
	ldr r0, _0804F8B4 @ =gUnknown_02029A10
	mov sl, r0
	ldr r2, [r2]
	mov r8, r2
	ldrh r4, [r2]
	lsls r2, r4, #3
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r6, [r3]
	ldrh r3, [r6]
	movs r1, #0xb4
	mov sb, r1
	mov r0, sb
	muls r0, r3, r0
	adds r2, r2, r0
	add r2, sl
	ldr r5, [r5]
	lsls r0, r3, #4
	adds r5, #0xa
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #4]
	mov r2, r8
	ldrh r0, [r2]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldrh r0, [r6]
	mov r3, sb
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r1, r0
	add r1, sl
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	strh r0, [r1, #8]
	mov r3, r8
	ldrh r4, [r3]
	lsls r2, r4, #3
	adds r2, r2, r4
	lsls r2, r2, #2
	ldrh r3, [r6]
	mov r0, sb
	muls r0, r3, r0
	adds r2, r2, r0
	add r2, sl
	lsls r0, r3, #4
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	strh r0, [r2, #6]
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r6]
	mov r2, sb
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	add r0, sl
	ldrh r1, [r0, #6]
	strh r1, [r0, #0xa]
	ldrh r0, [r6]
	mov r3, r8
	ldrh r1, [r3]
	ldr r3, _0804F8B8 @ =gUnknown_0855214C
	lsls r2, r0, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r3, #0x32
	bl sub_0804BCB8
	ldr r0, _0804F880 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, r8
	ldrh r1, [r2]
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	ldrh r1, [r6]
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	adds r2, r2, r1
	add r2, sl
	movs r3, #8
	ldrsh r1, [r2, r3]
	movs r3, #0xa
	ldrsh r2, [r2, r3]
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
_0804F880: .4byte gUnknown_03001FBC
_0804F884: .4byte gUnknown_03001470
_0804F888: .4byte gUnknown_081360B8
_0804F88C: .4byte gUnknown_081360BC
_0804F890: .4byte gUnknown_08551D0C
_0804F894: .4byte 0x000003FF
_0804F898: .4byte 0xFFFFFC00
_0804F89C: .4byte gUnknown_085523A4
_0804F8A0: .4byte gUnknown_0300450C
_0804F8A4: .4byte gUnknown_085D6A48
_0804F8A8: .4byte gUnknown_081360C0
_0804F8AC: .4byte gUnknown_085644E0
_0804F8B0: .4byte gUnknown_03004504
_0804F8B4: .4byte gUnknown_02029A10
_0804F8B8: .4byte gUnknown_0855214C

