	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B180
sub_0804B180: @ 0x0804B180
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	ldr r0, _0804B270 @ =gUnknown_03001FBC
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r0, sp
	bl sub_08015638
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r4, _0804B274 @ =gUnknown_03001470
	mov r5, r8
	movs r0, #0
	ldrsh r3, [r5, r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r3, r4, #0
	adds r3, #0x30
	adds r0, r0, r3
	ldr r3, _0804B278 @ =gUnknown_0300453C
	mov sb, r3
	ldrh r3, [r3]
	str r3, [r0]
	movs r0, #0
	ldrsh r3, [r5, r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r4, #0x34
	adds r0, r0, r4
	ldr r3, _0804B27C @ =gUnknown_0300451C
	mov sl, r3
	ldrh r3, [r3]
	str r3, [r0]
	mov r4, sb
	ldrh r0, [r4]
	movs r3, #1
	eors r3, r0
	movs r0, #1
	ands r3, r0
	lsls r3, r3, #0x1c
	ldr r0, _0804B280 @ =0xEFFFFFFF
	ands r0, r1
	adds r1, r0, #0
	orrs r1, r3
	ldr r3, _0804B284 @ =gUnknown_08551D0C
	ldrh r6, [r4]
	lsls r4, r6, #1
	adds r0, r4, r6
	adds r0, #2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldr r5, _0804B288 @ =0xFFFF0FFF
	ands r5, r2
	orrs r5, r0
	ldr r0, _0804B28C @ =gUnknown_08551D18
	adds r4, r4, r0
	ldrh r3, [r4]
	ldr r0, _0804B290 @ =0x000003FF
	ands r3, r0
	ldr r4, _0804B294 @ =0xFFFFFC00
	ands r4, r5
	orrs r4, r3
	ldr r3, _0804B298 @ =gUnknown_085523A4
	ldr r0, _0804B29C @ =gUnknown_0300450C
	ldrh r0, [r0]
	eors r6, r0
	lsls r6, r6, #1
	adds r6, r6, r3
	ldrh r0, [r6]
	movs r3, #3
	ands r0, r3
	lsls r0, r0, #0xa
	ldr r3, _0804B2A0 @ =0xFFFFF3FF
	ands r4, r3
	adds r2, r4, #0
	orrs r2, r0
	mov r5, r8
	movs r3, #0
	ldrsh r0, [r5, r3]
	bl sub_08015608
	movs r4, #0
	ldrsh r0, [r5, r4]
	ldr r4, _0804B2A4 @ =gUnknown_02029A10
	mov r5, sl
	ldrh r1, [r5]
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	mov r1, sb
	ldrh r3, [r1]
	movs r1, #0xb4
	muls r1, r3, r1
	adds r2, r2, r1
	adds r2, r2, r4
	movs r3, #4
	ldrsh r1, [r2, r3]
	movs r4, #0xa
	ldrsh r2, [r2, r4]
	bl sub_080155C0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B270: .4byte gUnknown_03001FBC
_0804B274: .4byte gUnknown_03001470
_0804B278: .4byte gUnknown_0300453C
_0804B27C: .4byte gUnknown_0300451C
_0804B280: .4byte 0xEFFFFFFF
_0804B284: .4byte gUnknown_08551D0C
_0804B288: .4byte 0xFFFF0FFF
_0804B28C: .4byte gUnknown_08551D18
_0804B290: .4byte 0x000003FF
_0804B294: .4byte 0xFFFFFC00
_0804B298: .4byte gUnknown_085523A4
_0804B29C: .4byte gUnknown_0300450C
_0804B2A0: .4byte 0xFFFFF3FF
_0804B2A4: .4byte gUnknown_02029A10

