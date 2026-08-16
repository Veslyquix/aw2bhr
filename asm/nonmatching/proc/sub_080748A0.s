	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080748A0
sub_080748A0: @ 0x080748A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	ldr r2, _080749E8 @ =gUnknown_0202FDFC
	movs r3, #0
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	str r1, [sp, #4]
	movs r0, #0x2e
	ldrsh r2, [r7, r0]
	ldr r1, _080749E8 @ =gUnknown_0202FDFC
	movs r3, #2
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	str r2, [sp, #8]
	ldr r3, [r7, #0x38]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x80
	lsls r2, r2, #1
	bl Interpolate
	mov r8, r0
	ldr r4, _080749EC @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	str r0, [sp, #0xc]
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r2, [r4, r3]
	mov sb, r2
	rsbs r2, r2, #0
	lsls r2, r2, #4
	mov sl, r2
	mov r0, sl
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #4
	mov sb, r0
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [sp, #0xc]
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, _080749F0 @ =gUnknown_081CC4C4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl PutSprite
	ldr r0, [sp, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r0, sl
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [sp, #0xc]
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, _080749F4 @ =gUnknown_081CC4CC
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #1
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl PutSprite
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r8, r2
	bne _080749D0
	movs r3, #0x2a
	ldrsh r1, [r7, r3]
	ldr r0, _080749E8 @ =gUnknown_0202FDFC
	adds r0, #0x12
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080749F8 @ =0x000001D1
	ldr r1, [sp, #4]
	bl sub_08072B54
	adds r0, r7, #0
	bl Proc_Break
_080749D0:
	ldr r0, [r7, #0x38]
	adds r0, #1
	str r0, [r7, #0x38]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080749E8: .4byte gUnknown_0202FDFC
_080749EC: .4byte gSinLut
_080749F0: .4byte gUnknown_081CC4C4
_080749F4: .4byte gUnknown_081CC4CC
_080749F8: .4byte 0x000001D1

