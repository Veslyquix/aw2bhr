	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036F68
sub_08036F68: @ 0x08036F68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, [sp, #0x3c]
	ldr r5, [sp, #0x4c]
	ldr r6, [sp, #0x50]
	mov r8, r6
	ldr r6, [sp, #0x54]
	ldr r7, [sp, #0x58]
	mov sl, r7
	ldr r7, [sp, #0x5c]
	mov ip, r7
	ldr r7, [sp, #0x64]
	mov sb, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	ldr r7, [sp, #0x40]
	lsls r4, r7, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	ldr r7, [sp, #0x44]
	lsls r4, r7, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #8]
	ldr r7, [sp, #0x48]
	lsls r4, r7, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0xc]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r4, r8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r8, r4
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r7, sl
	lsls r7, r7, #0x18
	adds r4, r7, #0
	lsrs r4, r4, #0x18
	mov sl, r4
	mov r7, ip
	lsls r7, r7, #0x18
	adds r4, r7, #0
	lsrs r4, r4, #0x18
	mov ip, r4
	ldr r7, [sp, #0x60]
	lsls r4, r7, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x18]
	mov r4, sb
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sb, r4
	ldr r7, [sp, #0x68]
	lsls r4, r7, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x10]
	ldr r7, [sp, #0x6c]
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #0x14]
	ldr r4, _080370CC @ =gUnknown_03002B5C
	movs r7, #0
	strh r7, [r4]
	ldr r4, _080370D0 @ =gUnknown_0300450C
	mov r7, sb
	strh r7, [r4]
	ldr r4, _080370D4 @ =gUnknown_03004580
	subs r1, #1
	strh r1, [r4]
	subs r5, #1
	strh r5, [r4, #0x10]
	subs r3, #1
	strh r3, [r4, #2]
	subs r6, #1
	strh r6, [r4, #0x12]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r4, #4]
	mov r3, sl
	strh r3, [r4, #0x14]
	strh r2, [r4, #6]
	mov r5, r8
	strh r5, [r4, #0x16]
	strh r0, [r4, #8]
	mov r6, sp
	ldrh r6, [r6, #0xc]
	strh r6, [r4, #0x18]
	mov r7, sp
	ldrh r7, [r7, #4]
	strh r7, [r4, #0xa]
	mov r0, ip
	strh r0, [r4, #0x1a]
	mov r1, sp
	ldrh r1, [r1, #8]
	strh r1, [r4, #0xc]
	mov r3, sp
	ldrh r3, [r3, #0x18]
	strh r3, [r4, #0x1c]
	ldr r3, _080370D8 @ =gUnknown_085D583C
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x10
	adds r0, r0, r3
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	strh r0, [r4, #0xe]
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	strh r0, [r4, #0x1e]
	ldr r0, _080370DC @ =gUnknown_02027F68
	movs r6, #0
	strb r6, [r0, #1]
	ldr r1, _080370E0 @ =gUnknown_03004528
	str r0, [r1]
	str r0, [r1, #4]
	ldr r0, _080370E4 @ =gUnknown_03004520
	mov r7, sp
	ldrh r7, [r7, #0x10]
	strh r7, [r0]
	bl sub_080546BC
	ldr r2, _080370E8 @ =gUnknown_03004504
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrh r0, [r0, #0x14]
	strh r0, [r2, #2]
	ldr r0, _080370EC @ =gUnknown_0849D3BC
	movs r1, #3
	bl Proc_Start
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080370CC: .4byte gUnknown_03002B5C
_080370D0: .4byte gUnknown_0300450C
_080370D4: .4byte gUnknown_03004580
_080370D8: .4byte gUnknown_085D583C
_080370DC: .4byte gUnknown_02027F68
_080370E0: .4byte gUnknown_03004528
_080370E4: .4byte gUnknown_03004520
_080370E8: .4byte gUnknown_03004504
_080370EC: .4byte gUnknown_0849D3BC

