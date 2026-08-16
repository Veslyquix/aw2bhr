	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076494
sub_08076494: @ 0x08076494
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r3, [r7, #0x5c]
	movs r4, #0x10
	str r4, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08074234
	mov sl, r0
	ldr r3, [r7, #0x5c]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_08074234
	str r0, [sp, #4]
	mov r0, sl
	lsls r0, r0, #4
	asrs r0, r0, #8
	mov sb, r0
	ldr r4, _080765BC @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	mov r0, r8
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r1, [r7, #0x2c]
	movs r6, #0xc0
	lsls r6, r6, #5
	orrs r1, r6
	movs r2, #0x10
	rsbs r2, r2, #0
	add sb, r2
	ldr r2, [r7, #0x30]
	mov r0, sb
	subs r2, r2, r0
	movs r5, #0xa0
	lsls r5, r5, #3
	orrs r2, r5
	ldr r3, _080765C0 @ =gUnknown_086144C0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	bl sub_0801BEFC
	ldr r1, [r7, #0x2c]
	ldr r0, [r7, #0x60]
	adds r1, r1, r0
	orrs r1, r6
	ldr r2, [r7, #0x30]
	adds r2, #0x10
	orrs r2, r5
	ldr r3, _080765C4 @ =gUnknown_086144D4
	str r4, [sp]
	movs r0, #1
	bl sub_0801BEFC
	ldr r2, _080765C8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080765CC @ =gUnknown_03002020
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0]
	ldr r1, _080765D0 @ =gUnknown_03002B28
	movs r0, #0x10
	ldr r2, [sp, #4]
	subs r0, r0, r2
	strh r0, [r1]
	ldr r0, _080765D4 @ =gUnknown_03001FFC
	strh r4, [r0]
	ldr r0, [r7, #0x5c]
	adds r0, #1
	str r0, [r7, #0x5c]
	cmp r0, #0xf
	ble _080765A6
	movs r0, #0xe6
	lsls r0, r0, #1
	bl sub_0803B4DC
	adds r0, r7, #0
	bl Proc_Break
_080765A6:
	bl sub_080763C0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080765BC: .4byte gUnknown_0808F100
_080765C0: .4byte gUnknown_086144C0
_080765C4: .4byte gUnknown_086144D4
_080765C8: .4byte gUnknown_030030E0
_080765CC: .4byte gUnknown_03002020
_080765D0: .4byte gUnknown_03002B28
_080765D4: .4byte gUnknown_03001FFC

