	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052CA4
sub_08052CA4: @ 0x08052CA4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	ldr r0, _08052DDC @ =gUnknown_03001FBC
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r2, _08052DE0 @ =gUnknown_03001470
	mov r3, sb
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
	ldr r1, _08052DE4 @ =gUnknown_0300453C
	mov sl, r1
	ldrh r1, [r1]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x34
	adds r0, r0, r1
	ldr r6, _08052DE8 @ =gUnknown_0300451C
	ldrh r1, [r6]
	str r1, [r0]
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r5, _08052DEC @ =gUnknown_02029808
	mov r1, sl
	ldrh r0, [r1]
	movs r2, #0x6c
	mov ip, r2
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, r5
	ldrh r0, [r0, #0x2e]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x3a
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _08052DF0 @ =0x000003FF
	adds r0, r3, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _08052DF4 @ =0xFFFFFC00
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
	ldr r3, _08052DF8 @ =gUnknown_02029A10
	ldrh r1, [r6]
	lsls r6, r1, #3
	adds r6, r6, r1
	lsls r6, r6, #2
	mov r2, sl
	ldrh r0, [r2]
	movs r2, #0xb4
	muls r2, r0, r2
	adds r6, r6, r2
	adds r6, r6, r3
	ldr r3, _08052DFC @ =gUnknown_08552D80
	mov r8, r3
	lsls r4, r0, #1
	lsls r2, r1, #1
	mov r3, ip
	muls r3, r0, r3
	adds r2, r2, r3
	adds r5, #0x30
	adds r2, r2, r5
	ldrh r3, [r2]
	lsls r2, r3, #3
	subs r2, r2, r3
	lsls r2, r2, #2
	adds r4, r4, r2
	mov r3, r8
	adds r3, #2
	adds r4, r4, r3
	ldrh r5, [r4]
	ldrh r3, [r6, #8]
	adds r5, r5, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	add r2, r8
	ldrh r4, [r2, #6]
	ldrh r6, [r6, #0xa]
	adds r4, r4, r6
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r2, #0
	bl sub_08052E04
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	mov r3, sl
	ldrh r0, [r3]
	mov r2, sb
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
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052DDC: .4byte gUnknown_03001FBC
_08052DE0: .4byte gUnknown_03001470
_08052DE4: .4byte gUnknown_0300453C
_08052DE8: .4byte gUnknown_0300451C
_08052DEC: .4byte gUnknown_02029808
_08052DF0: .4byte 0x000003FF
_08052DF4: .4byte 0xFFFFFC00
_08052DF8: .4byte gUnknown_02029A10
_08052DFC: .4byte gUnknown_08552D80

