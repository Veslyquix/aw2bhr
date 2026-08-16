	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806412C
sub_0806412C: @ 0x0806412C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r4, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	mov r8, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0xc]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov sl, r4
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sb, r5
	lsls r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	ldr r4, _080641FC @ =gUnknown_0858089C
	ldr r7, _08064200 @ =gUnknown_085808CC
	movs r1, #0
	lsrs r6, r6, #4
	mov ip, r6
	lsrs r0, r0, #4
	mov r8, r0
	movs r5, #0
_0806417C:
	ldr r2, _08064204 @ =gUnknown_0202F140
	adds r3, r5, r2
	movs r2, #2
_08064182:
	movs r6, #0
	ldrsh r0, [r4, r6]
	lsls r0, r0, #0xc
	stm r3!, {r0}
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge _08064182
	adds r5, #0x18
	adds r1, #1
	cmp r1, #7
	ble _0806417C
	movs r1, #0
	ldr r0, _08064208 @ =gUnknown_0202F110
	adds r4, r0, #2
_080641A0:
	adds r3, r1, #1
	lsls r0, r1, #3
	adds r1, r0, r4
	movs r2, #3
_080641A8:
	ldrb r0, [r7]
	strb r0, [r1]
	adds r7, #1
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bge _080641A8
	adds r1, r3, #0
	cmp r1, #5
	ble _080641A0
	ldr r0, _08064208 @ =gUnknown_0202F110
	mov r7, sp
	ldrh r7, [r7]
	strh r7, [r0]
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0, #8]
	mov r2, sp
	ldrh r2, [r2, #8]
	strh r2, [r0, #0x10]
	mov r6, sp
	ldrh r6, [r6, #0xc]
	strh r6, [r0, #0x18]
	mov r7, sl
	strh r7, [r0, #0x20]
	mov r1, sb
	strh r1, [r0, #0x28]
	ldr r0, _0806420C @ =gUnknown_030005F4
	mov r2, ip
	str r2, [r0]
	ldr r0, _08064210 @ =gUnknown_030005F8
	mov r6, r8
	str r6, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080641FC: .4byte gUnknown_0858089C
_08064200: .4byte gUnknown_085808CC
_08064204: .4byte gUnknown_0202F140
_08064208: .4byte gUnknown_0202F110
_0806420C: .4byte gUnknown_030005F4
_08064210: .4byte gUnknown_030005F8

