	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C4A8
sub_0804C4A8: @ 0x0804C4A8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804C550 @ =gUnknown_0300453C
	strh r5, [r0]
	ldr r2, _0804C554 @ =gUnknown_0300451C
	ldr r1, _0804C558 @ =gUnknown_08552148
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, _0804C55C @ =gUnknown_03004580
	lsls r1, r5, #4
	adds r2, r1, r0
	ldrh r2, [r2]
	mov sb, r2
	adds r0, #8
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r5, #0
	bl sub_0804C400
	ldr r0, _0804C560 @ =gUnknown_08557680
	mov r8, r0
	ldr r0, _0804C564 @ =gUnknown_08562128
	adds r4, r4, r0
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, _0804C568 @ =gUnknown_08552FB0
	lsls r6, r5, #2
	adds r1, r6, r1
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _0804C56C @ =gUnknown_08552178
	adds r6, r6, r5
	lsls r6, r6, #1
	adds r0, #8
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	ldr r0, _0804C570 @ =gUnknown_0855333C
	mov r1, sb
	lsls r3, r1, #1
	add r3, sb
	lsls r3, r3, #2
	mov r1, r8
	adds r1, #8
	adds r1, r3, r1
	ldr r2, [r1]
	movs r1, #4
	add r8, r1
	add r3, r8
	ldr r3, [r3]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	ldr r1, _0804C574 @ =gUnknown_02029668
	adds r1, #8
	adds r6, r6, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r6]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C550: .4byte gUnknown_0300453C
_0804C554: .4byte gUnknown_0300451C
_0804C558: .4byte gUnknown_08552148
_0804C55C: .4byte gUnknown_03004580
_0804C560: .4byte gUnknown_08557680
_0804C564: .4byte gUnknown_08562128
_0804C568: .4byte gUnknown_08552FB0
_0804C56C: .4byte gUnknown_08552178
_0804C570: .4byte gUnknown_0855333C
_0804C574: .4byte gUnknown_02029668

