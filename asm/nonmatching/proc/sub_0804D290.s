	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D290
sub_0804D290: @ 0x0804D290
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r7, _0804D4A8 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r7, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r2, _0804D4AC @ =gUnknown_03001470
	movs r3, #0
	ldrsh r1, [r7, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x2c
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	movs r3, #0
	ldrsh r1, [r7, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r5, _0804D4B0 @ =gUnknown_0300453C
	ldrh r1, [r5]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x34
	adds r0, r0, r1
	ldr r1, _0804D4B4 @ =gUnknown_0300451C
	mov sl, r1
	ldrh r1, [r1]
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
	ldr r2, _0804D4B8 @ =gUnknown_08551D0C
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
	ldr r2, _0804D4BC @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _0804D4C0 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r1, _0804D4C4 @ =gUnknown_085523A4
	ldr r0, _0804D4C8 @ =gUnknown_0300450C
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
	ldr r3, _0804D4CC @ =gUnknown_085D6A48
	ldr r6, _0804D4D0 @ =gUnknown_03004580
	ldrh r2, [r5]
	lsls r2, r2, #4
	ldr r4, _0804D4D4 @ =gUnknown_03004582
	adds r0, r2, r4
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r1, r6, #6
	adds r2, r2, r1
	ldrh r1, [r2]
	bl sub_08057D44
	ldr r1, _0804D4D8 @ =gUnknown_02029A10
	mov sb, r1
	mov r2, sl
	ldrh r4, [r2]
	lsls r2, r4, #3
	adds r2, r2, r4
	lsls r2, r2, #2
	ldrh r3, [r5]
	movs r1, #0xb4
	mov r8, r1
	mov r1, r8
	muls r1, r3, r1
	adds r2, r2, r1
	add r2, sb
	lsls r1, r3, #2
	adds r1, r1, r3
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r0, r1
	ldrh r1, [r1]
	strh r1, [r2, #4]
	mov r3, sl
	ldrh r2, [r3]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r2, [r5]
	mov r4, r8
	muls r4, r2, r4
	adds r2, r4, #0
	adds r1, r1, r2
	add r1, sb
	ldrh r2, [r1, #4]
	strh r2, [r1, #8]
	ldrh r4, [r3]
	lsls r2, r4, #3
	adds r2, r2, r4
	lsls r2, r2, #2
	ldrh r3, [r5]
	mov r1, r8
	muls r1, r3, r1
	adds r2, r2, r1
	add r2, sb
	lsls r1, r3, #2
	adds r1, r1, r3
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	strh r0, [r2, #6]
	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r5]
	mov r2, r8
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	add r0, sb
	ldrh r1, [r0, #6]
	strh r1, [r0, #0xa]
	mov r3, sl
	ldrh r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r5]
	mov r4, r8
	muls r4, r1, r4
	adds r1, r4, #0
	adds r0, r0, r1
	add r0, sb
	movs r1, #0
	strh r1, [r0, #0x1e]
	ldrh r0, [r5]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_0804BCB8
	movs r2, #0
	ldrsh r0, [r7, r2]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldr r0, _0804D4DC @ =gUnknown_084C3F70
	ldrh r3, [r5]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r4, [r0]
	ldr r0, _0804D4E0 @ =gUnknown_084C3F78
	adds r1, r1, r0
	ldr r1, [r1]
	mov ip, r1
	movs r1, #0
	ldrsh r0, [r7, r1]
	mov r2, sl
	ldrh r1, [r2]
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	mov r1, r8
	muls r1, r3, r1
	adds r2, r2, r1
	add r2, sb
	ldrh r1, [r2, #8]
	ldrh r3, [r4]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #0xa]
	mov r4, ip
	ldrh r3, [r4]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	movs r1, #0
	ldrsh r0, [r7, r1]
	ldr r4, _0804D4E4 @ =gUnknown_08552FB8
	ldrh r1, [r5]
	lsls r1, r1, #4
	adds r6, #4
	adds r6, r1, r6
	ldrh r2, [r6]
	lsls r3, r2, #1
	adds r3, r3, r2
	ldr r2, _0804D4D4 @ =gUnknown_03004582
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r1, r2, #3
	adds r1, r1, r2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r4, #8
	adds r1, r1, r4
	ldr r1, [r1]
	bl sub_08015928
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D4A8: .4byte gUnknown_03001FBC
_0804D4AC: .4byte gUnknown_03001470
_0804D4B0: .4byte gUnknown_0300453C
_0804D4B4: .4byte gUnknown_0300451C
_0804D4B8: .4byte gUnknown_08551D0C
_0804D4BC: .4byte 0x000003FF
_0804D4C0: .4byte 0xFFFFFC00
_0804D4C4: .4byte gUnknown_085523A4
_0804D4C8: .4byte gUnknown_0300450C
_0804D4CC: .4byte gUnknown_085D6A48
_0804D4D0: .4byte gUnknown_03004580
_0804D4D4: .4byte gUnknown_03004582
_0804D4D8: .4byte gUnknown_02029A10
_0804D4DC: .4byte gUnknown_084C3F70
_0804D4E0: .4byte gUnknown_084C3F78
_0804D4E4: .4byte gUnknown_08552FB8

