	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080524C0
sub_080524C0: @ 0x080524C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08052620 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r2, _08052624 @ =gUnknown_03001470
	ldr r3, _08052620 @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x28
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r7, _08052628 @ =gUnknown_0300453C
	ldrh r1, [r7]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x34
	adds r0, r0, r1
	ldr r3, _0805262C @ =gUnknown_0300451C
	ldrh r1, [r3]
	str r1, [r0]
	ldr r2, _08052630 @ =gUnknown_08551D0C
	ldrh r1, [r7]
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
	ldr r5, _08052634 @ =gUnknown_02029808
	ldrh r0, [r7]
	movs r1, #0x6c
	mov sb, r1
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, r5
	ldrh r0, [r0, #0x2e]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x3a
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r2, _08052638 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _0805263C @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r2, _08052640 @ =gUnknown_02029A10
	ldrh r1, [r3]
	lsls r3, r1, #3
	mov r8, r3
	adds r6, r3, r1
	lsls r6, r6, #2
	ldrh r3, [r7]
	movs r0, #0xb4
	muls r0, r3, r0
	adds r6, r6, r0
	adds r6, r6, r2
	ldr r0, _08052644 @ =gUnknown_08552D80
	mov ip, r0
	lsls r4, r3, #1
	lsls r1, r1, #1
	mov r0, sb
	muls r0, r3, r0
	adds r1, r1, r0
	adds r5, #0x30
	adds r1, r1, r5
	ldrh r0, [r1]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r0, r4, r2
	mov r1, ip
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	mov sb, r0
	ldrh r1, [r6, #8]
	add sb, r1
	ldr r0, _08052648 @ =gUnknown_085D7E28
	mov sl, r0
	add r4, r8
	ldr r0, _0805264C @ =gUnknown_03004580
	lsls r3, r3, #4
	adds r0, #2
	adds r3, r3, r0
	ldrh r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r4, r1
	add r4, sl
	ldrh r5, [r4]
	add r5, sb
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	add r2, ip
	ldrh r0, [r2, #6]
	ldrh r6, [r6, #0xa]
	adds r0, r0, r6
	add r8, r1
	add r8, sl
	mov r1, r8
	ldrh r4, [r1, #4]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r2, _08052620 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldrh r0, [r7]
	ldr r2, _08052620 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08050528
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052620: .4byte gUnknown_03001FBC
_08052624: .4byte gUnknown_03001470
_08052628: .4byte gUnknown_0300453C
_0805262C: .4byte gUnknown_0300451C
_08052630: .4byte gUnknown_08551D0C
_08052634: .4byte gUnknown_02029808
_08052638: .4byte 0x000003FF
_0805263C: .4byte 0xFFFFFC00
_08052640: .4byte gUnknown_02029A10
_08052644: .4byte gUnknown_08552D80
_08052648: .4byte gUnknown_085D7E28
_0805264C: .4byte gUnknown_03004580

