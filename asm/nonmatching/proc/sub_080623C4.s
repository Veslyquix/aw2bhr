	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080623C4
sub_080623C4: @ 0x080623C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	ldr r4, _08062414 @ =0x00007FFF
	ldr r0, _08062418 @ =gUnknown_03003F20
	ldr r3, [r0]
	movs r5, #0
	movs r1, #2
	ldrsh r0, [r3, r1]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08062442
	ldr r7, _0806241C @ =gUnknown_08499590
	mov ip, r7
	mov sl, r4
	adds r6, r1, #0
_080623EE:
	mov r0, ip
	ldr r2, [r0]
	ldrb r1, [r3, #1]
	lsls r1, r1, #1
	ldr r7, _08062420 @ =0x0000417A
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r3]
	adds r1, r1, r0
	ldr r0, _08062424 @ =0x00003262
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r0, [r2]
	cmp r0, #0
	beq _08062428
	mov r1, sl
	strh r1, [r3, #2]
	b _08062438
	.align 2, 0
_08062414: .4byte 0x00007FFF
_08062418: .4byte gUnknown_03003F20
_0806241C: .4byte gUnknown_08499590
_08062420: .4byte 0x0000417A
_08062424: .4byte 0x00003262
_08062428:
	movs r7, #2
	ldrsh r1, [r3, r7]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08062438
	ldrh r4, [r3, #2]
	adds r5, r3, #0
_08062438:
	adds r3, #4
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, r6
	bne _080623EE
_08062442:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08062460 @ =0x00007FFF
	cmp r0, r1
	beq _08062464
	strh r1, [r5, #2]
	ldrb r0, [r5]
	mov r7, r8
	str r0, [r7]
	ldrb r0, [r5, #1]
	mov r1, sb
	str r0, [r1]
	movs r0, #1
	b _08062466
	.align 2, 0
_08062460: .4byte 0x00007FFF
_08062464:
	movs r0, #0
_08062466:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

