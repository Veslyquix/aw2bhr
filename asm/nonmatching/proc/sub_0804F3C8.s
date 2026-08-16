	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804F3C8
sub_0804F3C8: @ 0x0804F3C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r2, _0804F538 @ =gUnknown_03001470
	ldr r4, _0804F53C @ =gUnknown_081360AC
	ldr r0, [r4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r2, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r7, [r0]
	adds r2, #0x34
	adds r1, r1, r2
	ldrh r1, [r1]
	mov sb, r1
	ldr r3, _0804F540 @ =gUnknown_081360B0
	ldr r2, [r3]
	mov ip, r2
	lsls r0, r1, #3
	add r0, sb
	lsls r0, r0, #2
	movs r1, #0xb4
	adds r5, r7, #0
	muls r5, r1, r5
	adds r0, r0, r5
	adds r6, r0, r2
	ldr r2, _0804F544 @ =gUnknown_02029B94
	mov r0, sb
	lsls r1, r0, #1
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #1
	mov sl, r0
	add r1, sl
	adds r1, r1, r2
	ldrh r0, [r1]
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	ldrh r1, [r6, #0x20]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #1
	bne _0804F494
	ldrh r0, [r6, #0x22]
	adds r0, #1
	strh r0, [r6, #0x22]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bne _0804F440
	movs r0, #0
	strh r0, [r6, #0x22]
_0804F440:
	ldrh r6, [r6, #0x22]
	lsls r3, r6, #3
	adds r3, r3, r6
	lsls r3, r3, #2
	adds r3, r3, r5
	add r3, ip
	ldr r0, _0804F548 @ =gUnknown_08552148
	lsls r4, r7, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	add r1, ip
	ldr r2, _0804F54C @ =gUnknown_08553524
	mov r8, r2
	lsls r2, r6, #1
	add r2, sl
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	ldrh r1, [r1, #8]
	adds r0, r0, r1
	strh r0, [r3, #8]
	ldrh r0, [r4]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	add r1, ip
	adds r2, #1
	lsls r2, r2, #1
	add r2, r8
	ldrh r0, [r2]
	ldrh r1, [r1, #0xa]
	adds r0, r0, r1
	strh r0, [r3, #0xa]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_080520B8
_0804F494:
	ldr r3, _0804F550 @ =gUnknown_081360B4
	ldr r5, [r3]
	lsls r2, r7, #2
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r1, r0, r5
	mov r8, r1
	ldrh r4, [r1, #0x18]
	lsls r1, r4, #1
	adds r1, r1, r0
	mov ip, r1
	adds r1, r5, #0
	adds r1, #0x1e
	add r1, ip
	lsls r0, r4, #2
	adds r0, r0, r4
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0804F554 @ =gUnknown_03004508
	ldrh r0, [r0]
	mov r1, sb
	lsls r1, r1, #3
	str r1, [sp]
	mov sl, r2
	cmp r0, r6
	bne _0804F5A6
	adds r0, r5, #0
	adds r0, #0xc
	add r0, ip
	ldrh r6, [r0]
	cmp r6, #0xff
	beq _0804F564
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080505A4
	ldr r2, _0804F558 @ =gUnknown_02029A10
	ldr r1, [sp]
	add r1, sb
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r7, r0
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	ldr r4, _0804F55C @ =gUnknown_085D6C88
	mov r2, r8
	ldrb r0, [r2, #0x1a]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, _0804F560 @ =gUnknown_03004580
	lsls r3, r7, #4
	adds r0, r2, #4
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r2, #2
	adds r3, r3, r2
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r4, #0xc
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_0803B48C
	mov r1, r8
	ldrb r0, [r1, #0x1a]
	adds r0, #1
	strb r0, [r1, #0x1a]
	b _0804F596
	.align 2, 0
_0804F538: .4byte gUnknown_03001470
_0804F53C: .4byte gUnknown_081360AC
_0804F540: .4byte gUnknown_081360B0
_0804F544: .4byte gUnknown_02029B94
_0804F548: .4byte gUnknown_08552148
_0804F54C: .4byte gUnknown_08553524
_0804F550: .4byte gUnknown_081360B4
_0804F554: .4byte gUnknown_03004508
_0804F558: .4byte gUnknown_02029A10
_0804F55C: .4byte gUnknown_085D6C88
_0804F560: .4byte gUnknown_03004580
_0804F564:
	ldr r1, _0804F638 @ =gUnknown_02029A10
	movs r0, #0xb4
	muls r0, r7, r0
	adds r4, r0, r1
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804F596
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804F596
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	ldr r1, _0804F63C @ =gUnknown_02029BA8
	lsls r2, r7, #5
	adds r1, #4
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
_0804F596:
	ldr r0, _0804F640 @ =gUnknown_020296B0
	mov r2, sl
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
_0804F5A6:
	adds r0, r7, #0
	mov r1, sb
	bl sub_08056E9C
	ldr r0, _0804F644 @ =gUnknown_03001FBC
	mov r8, r0
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r7, #0
	mov r1, sb
	bl sub_0804BECC
	ldr r1, _0804F648 @ =gUnknown_084C3F78
	add r1, sl
	ldr r6, [r1]
	ldr r2, _0804F638 @ =gUnknown_02029A10
	ldr r4, [sp]
	add r4, sb
	lsls r4, r4, #2
	movs r1, #0xb4
	muls r1, r7, r1
	adds r4, r4, r1
	adds r4, r4, r2
	ldr r2, _0804F64C @ =gUnknown_08553B28
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r2, [r4, #8]
	adds r0, r0, r2
	strh r0, [r4, #8]
	ldr r1, _0804F650 @ =gUnknown_085644D4
	ldr r0, _0804F654 @ =gUnknown_02028E5C
	add r0, sl
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r4, #0xa]
	mov r0, r8
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r7, #0
	mov r1, sb
	bl sub_0804EE08
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r2, #8
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #0xa]
	ldrh r3, [r6]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F638: .4byte gUnknown_02029A10
_0804F63C: .4byte gUnknown_02029BA8
_0804F640: .4byte gUnknown_020296B0
_0804F644: .4byte gUnknown_03001FBC
_0804F648: .4byte gUnknown_084C3F78
_0804F64C: .4byte gUnknown_08553B28
_0804F650: .4byte gUnknown_085644D4
_0804F654: .4byte gUnknown_02028E5C

