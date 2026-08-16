	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C6DC
sub_0804C6DC: @ 0x0804C6DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	ldr r5, _0804C7FC @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r5, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r3, _0804C800 @ =gUnknown_03001470
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x28
	adds r0, r0, r1
	movs r2, #0
	str r2, [r0]
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x2c
	adds r0, r0, r1
	str r2, [r0]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r6, _0804C804 @ =gUnknown_0300453C
	ldrh r1, [r6]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r3, #0
	adds r1, #0x34
	adds r0, r0, r1
	ldr r1, _0804C808 @ =gUnknown_0300451C
	mov r8, r1
	ldrh r1, [r1]
	str r1, [r0]
	ldrh r3, [r6]
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
	ldr r2, _0804C80C @ =gUnknown_08551D0C
	ldrh r1, [r6]
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
	ldrh r1, [r6]
	lsls r1, r1, #8
	adds r1, #0x50
	ldr r2, _0804C810 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _0804C814 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r1, _0804C818 @ =gUnknown_085523A4
	ldr r0, _0804C81C @ =gUnknown_0300450C
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
	movs r3, #0
	ldrsh r0, [r5, r3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldr r4, _0804C820 @ =gUnknown_02029A10
	mov r2, r8
	ldrh r1, [r2]
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	ldrh r3, [r6]
	movs r1, #0xb4
	muls r1, r3, r1
	adds r2, r2, r1
	adds r2, r2, r4
	movs r3, #8
	ldrsh r1, [r2, r3]
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	bl sub_080155C0
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldr r1, _0804C824 @ =sub_0804C8C8
	bl sub_08015928
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C7FC: .4byte gUnknown_03001FBC
_0804C800: .4byte gUnknown_03001470
_0804C804: .4byte gUnknown_0300453C
_0804C808: .4byte gUnknown_0300451C
_0804C80C: .4byte gUnknown_08551D0C
_0804C810: .4byte 0x000003FF
_0804C814: .4byte 0xFFFFFC00
_0804C818: .4byte gUnknown_085523A4
_0804C81C: .4byte gUnknown_0300450C
_0804C820: .4byte gUnknown_02029A10
_0804C824: .4byte sub_0804C8C8

