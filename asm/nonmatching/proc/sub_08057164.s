	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057164
sub_08057164: @ 0x08057164
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r0, #0
	mov sb, r0
	ldr r1, _080571C8 @ =gUnknown_02029A10
	ldr r2, _080571CC @ =gUnknown_0855203C
	mov sl, r2
	movs r0, #0xb4
	muls r0, r6, r0
	adds r5, r0, r1
	lsls r1, r6, #4
	ldr r0, _080571D0 @ =gUnknown_03004582
	adds r1, r1, r0
	str r1, [sp]
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #1
	lsls r1, r6, #2
	adds r2, r1, r6
	str r2, [sp, #4]
	adds r0, r0, r1
	adds r7, r0, r6
_080571A2:
	ldr r1, [sp]
	ldrh r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r2, _080571D4 @ =gUnknown_085D6A48
	adds r1, r1, r2
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _080571FA
	ldr r0, _080571D8 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r6, r0
	bne _080571DC
	lsls r0, r7, #1
	add r0, sl
	ldrh r0, [r0]
	b _08057210
	.align 2, 0
_080571C8: .4byte gUnknown_02029A10
_080571CC: .4byte gUnknown_0855203C
_080571D0: .4byte gUnknown_03004582
_080571D4: .4byte gUnknown_085D6A48
_080571D8: .4byte gUnknown_0300450C
_080571DC:
	mov r1, ip
	lsls r0, r1, #2
	adds r1, r0, r1
	lsls r1, r1, #1
	ldr r2, [sp, #4]
	adds r1, r1, r2
	add r1, sb
	lsls r1, r1, #1
	add r1, sl
	ldrh r1, [r1]
	strh r1, [r5, #0x1a]
	mov r2, r8
	lsls r1, r2, #2
	adds r4, r0, #0
	b _0805721A
_080571FA:
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	bne _08057208
	ldr r0, _08057204 @ =gUnknown_08551F60
	b _0805720A
	.align 2, 0
_08057204: .4byte gUnknown_08551F60
_08057208:
	ldr r0, _08057268 @ =gUnknown_08551E84
_0805720A:
	lsls r1, r7, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_08057210:
	strh r0, [r5, #0x1a]
	mov r0, r8
	lsls r1, r0, #2
	mov r2, ip
	lsls r4, r2, #2
_0805721A:
	ldr r3, _0805726C @ =gUnknown_085521DC
	mov r2, r8
	adds r0, r1, r2
	add r0, sb
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	subs r1, r1, r6
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r2, #0
	strb r0, [r5]
	add r4, ip
	adds r0, r4, #0
	add r0, sb
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r5, #1]
	strb r2, [r5, #2]
	strh r2, [r5, #4]
	strh r2, [r5, #6]
	adds r5, #0x24
	adds r7, #1
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #4
	ble _080571A2
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057268: .4byte gUnknown_08551E84
_0805726C: .4byte gUnknown_085521DC

