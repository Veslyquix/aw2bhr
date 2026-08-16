	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BA90
sub_0807BA90: @ 0x0807BA90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	ldr r0, _0807BC14 @ =gUnknown_0822BE1C
	ldr r1, _0807BC18 @ =gUnknown_081D932C
	mov r8, r1
	ldr r1, [r1]
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _0807BC1C @ =gUnknown_0822D888
	ldr r1, _0807BC20 @ =gUnknown_08499580
	ldr r1, [r1]
	bl sub_08011CAC
	bl sub_08013B0C
	ldr r5, _0807BC24 @ =gUnknown_081D9330
	ldr r6, [r5]
	ldr r0, _0807BC28 @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	bl sub_08024944
	ldr r4, _0807BC2C @ =gUnknown_0202FF78
	str r7, [sp]
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0x80
	bl sub_0807B7BC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r6]
	movs r0, #0
	strb r0, [r4]
	mov r6, r8
	add r2, sp, #0xc
	mov sl, r2
	mov r0, sp
	adds r0, #0xe
	str r0, [sp, #0x18]
	mov r1, sp
	adds r1, #0x10
	str r1, [sp, #0x1c]
	mov r2, sp
	adds r2, #0x12
	str r2, [sp, #0x20]
	adds r0, #6
	str r0, [sp, #0x24]
	movs r1, #0x1d
_0807BB08:
	ldrb r0, [r4]
	ldrb r2, [r4, #1]
	adds r0, r0, r2
	adds r0, #1
	strb r0, [r4, #1]
	adds r4, #1
	subs r1, #1
	cmp r1, #0
	bge _0807BB08
	ldr r0, [r5]
	ldr r1, [r0]
	adds r0, r7, #0
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, _0807BC30 @ =gUnknown_0822DE80
	movs r1, #0x80
	lsls r1, r1, #2
	mov sb, r1
	movs r2, #0x20
	bl sub_08013618
	ldr r2, _0807BC34 @ =gUnknown_030030CC
	ldrb r1, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, [r6]
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r4, _0807BC38 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r2, r2, #4
	mov r8, r2
	mov r0, r8
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	movs r0, #0xf0
	lsls r0, r0, #1
	str r0, [r7, #0x2c]
	movs r0, #0x6a
	str r0, [r7, #0x5c]
	movs r0, #0
	str r0, [r7, #0x58]
	adds r1, r7, #0
	adds r1, #0x64
	movs r0, #0xf0
	strh r0, [r1]
	movs r1, #0
	str r1, [r7, #0x34]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r7, #0x2c]
	mov r2, sl
	strh r0, [r2]
	movs r0, #0x50
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	ldr r0, [r7, #0x5c]
	ldr r2, [sp, #0x1c]
	strh r0, [r2]
	ldr r1, [sp, #0x20]
	strh r0, [r1]
	ldr r0, [r7, #0x58]
	ldr r2, [sp, #0x24]
	strh r0, [r2]
	ldr r1, _0807BC3C @ =gUnknown_030024D0
	add r0, sp, #4
	movs r2, #1
	bl BgAffineSet
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BC14: .4byte gUnknown_0822BE1C
_0807BC18: .4byte gUnknown_081D932C
_0807BC1C: .4byte gUnknown_0822D888
_0807BC20: .4byte gUnknown_08499580
_0807BC24: .4byte gUnknown_081D9330
_0807BC28: .4byte gUnknown_03003FC0
_0807BC2C: .4byte gUnknown_0202FF78
_0807BC30: .4byte gUnknown_0822DE80
_0807BC34: .4byte gUnknown_030030CC
_0807BC38: .4byte gUnknown_0808F100
_0807BC3C: .4byte gUnknown_030024D0

