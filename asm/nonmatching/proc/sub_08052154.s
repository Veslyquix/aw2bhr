	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052154
sub_08052154: @ 0x08052154
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	ldr r6, _0805224C @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r2, _08052250 @ =gUnknown_03001470
	movs r3, #0
	ldrsh r1, [r6, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x28
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r1, _08052254 @ =gUnknown_0300453C
	mov r8, r1
	ldrh r1, [r1]
	str r1, [r0]
	movs r3, #0
	ldrsh r1, [r6, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x34
	adds r0, r0, r1
	ldr r5, _08052258 @ =gUnknown_0300451C
	ldrh r1, [r5]
	str r1, [r0]
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r1, _0805225C @ =gUnknown_02029808
	mov r0, r8
	ldrh r2, [r0]
	movs r0, #0x6c
	muls r2, r0, r2
	adds r0, r2, r1
	ldrh r0, [r0, #0x2e]
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r1, #0x3a
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r2, _08052260 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _08052264 @ =0xFFFFFC00
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
	ldr r3, _08052268 @ =gUnknown_02029A10
	ldrh r0, [r5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r0, r8
	ldrh r2, [r0]
	movs r0, #0xb4
	muls r0, r2, r0
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, _0805226C @ =gUnknown_08552D80
	lsls r2, r2, #1
	adds r0, #0x56
	adds r2, r2, r0
	ldrh r4, [r2]
	ldrh r2, [r1, #8]
	adds r4, r4, r2
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r5, [r1, #0xa]
	movs r3, #0
	ldrsh r0, [r6, r3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	ldrsh r1, [r6, r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_08050528
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805224C: .4byte gUnknown_03001FBC
_08052250: .4byte gUnknown_03001470
_08052254: .4byte gUnknown_0300453C
_08052258: .4byte gUnknown_0300451C
_0805225C: .4byte gUnknown_02029808
_08052260: .4byte 0x000003FF
_08052264: .4byte 0xFFFFFC00
_08052268: .4byte gUnknown_02029A10
_0805226C: .4byte gUnknown_08552D80

