	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08051A44
sub_08051A44: @ 0x08051A44
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	ldr r6, _08051B10 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r2, _08051B14 @ =gUnknown_03001470
	movs r3, #0
	ldrsh r1, [r6, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r5, _08051B18 @ =gUnknown_0300453C
	ldrh r1, [r5]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r2, #0x34
	adds r0, r0, r2
	ldr r1, _08051B1C @ =gUnknown_0300451C
	mov r8, r1
	ldrh r1, [r1]
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
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r2, _08051B20 @ =gUnknown_020297C0
	ldrh r1, [r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r2, _08051B24 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _08051B28 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldrb r0, [r4, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #5]
	movs r3, #0
	ldrsh r0, [r6, r3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldrh r0, [r5]
	movs r4, #0
	ldrsh r1, [r6, r4]
	ldr r4, _08051B2C @ =gUnknown_02029A10
	mov r3, r8
	ldrh r2, [r3]
	lsls r3, r2, #3
	adds r3, r3, r2
	lsls r3, r3, #2
	movs r2, #0xb4
	muls r2, r0, r2
	adds r3, r3, r2
	adds r3, r3, r4
	movs r4, #8
	ldrsh r2, [r3, r4]
	movs r4, #0xa
	ldrsh r3, [r3, r4]
	bl sub_08050528
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051B10: .4byte gUnknown_03001FBC
_08051B14: .4byte gUnknown_03001470
_08051B18: .4byte gUnknown_0300453C
_08051B1C: .4byte gUnknown_0300451C
_08051B20: .4byte gUnknown_020297C0
_08051B24: .4byte 0x000003FF
_08051B28: .4byte 0xFFFFFC00
_08051B2C: .4byte gUnknown_02029A10

