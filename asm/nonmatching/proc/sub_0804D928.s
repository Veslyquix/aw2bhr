	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D928
sub_0804D928: @ 0x0804D928
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r6, _0804DA18 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r3, _0804DA1C @ =gUnknown_03001470
	movs r2, #0
	ldrsh r1, [r6, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x28
	adds r0, r0, r1
	movs r2, #0
	str r2, [r0]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x2c
	adds r0, r0, r1
	str r2, [r0]
	movs r2, #0
	ldrsh r1, [r6, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r5, _0804DA20 @ =gUnknown_0300453C
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
	ldr r1, _0804DA24 @ =gUnknown_0300451C
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
	ldr r2, _0804DA28 @ =gUnknown_08551D0C
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
	adds r1, #0x60
	ldr r2, _0804DA2C @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _0804DA30 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r1, _0804DA34 @ =gUnknown_085523A4
	ldr r0, _0804DA38 @ =gUnknown_0300450C
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
	movs r2, #0
	ldrsh r0, [r6, r2]
	ldr r1, _0804DA3C @ =sub_0804DA40
	bl sub_08015928
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DA18: .4byte gUnknown_03001FBC
_0804DA1C: .4byte gUnknown_03001470
_0804DA20: .4byte gUnknown_0300453C
_0804DA24: .4byte gUnknown_0300451C
_0804DA28: .4byte gUnknown_08551D0C
_0804DA2C: .4byte 0x000003FF
_0804DA30: .4byte 0xFFFFFC00
_0804DA34: .4byte gUnknown_085523A4
_0804DA38: .4byte gUnknown_0300450C
_0804DA3C: .4byte sub_0804DA40

