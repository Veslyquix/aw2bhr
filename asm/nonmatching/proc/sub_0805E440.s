	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E440
sub_0805E440: @ 0x0805E440
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, _0805E45C @ =gUnknown_0816DA6C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_080202A4
	movs r7, #0
	b _0805E584
	.align 2, 0
_0805E45C: .4byte gUnknown_0816DA6C
_0805E460:
	movs r6, #0
	adds r2, r1, #0
	ldr r0, [r2]
	ldr r0, [r0]
	adds r1, r7, #1
	str r1, [sp, #4]
	ldrh r0, [r0]
	cmp r6, r0
	blt _0805E474
	b _0805E582
_0805E474:
	mov r8, r6
_0805E476:
	ldr r1, _0805E514 @ =gUnknown_03003340
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805E56C
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r2, r7, #1
	ldr r3, _0805E518 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r5, [r1]
	cmp r5, #0
	beq _0805E56C
	movs r0, #0xc0
	ands r0, r5
	ldr r1, _0805E51C @ =gUnknown_03003F2C
	ldrh r1, [r1]
	cmp r0, r1
	bne _0805E56C
	mov r1, r8
	asrs r0, r1, #0x10
	lsls r4, r7, #0x10
	asrs r1, r4, #0x10
	bl sub_0804236C
	lsls r0, r0, #0x18
	mov sb, r8
	mov sl, r4
	cmp r0, #0
	beq _0805E56C
	ldr r1, _0805E520 @ =gUnknown_08499594
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r5, r1, r0
	ldrb r1, [r5, #4]
	movs r4, #0x7f
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0805E4EE
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	cmp r0, #9
	beq _0805E56C
_0805E4EE:
	ldr r0, _0805E524 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0805E56C
	ldrb r1, [r5, #4]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0805E528
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r5, r0, #1
	b _0805E52A
	.align 2, 0
_0805E514: .4byte gUnknown_03003340
_0805E518: .4byte 0x0000417A
_0805E51C: .4byte gUnknown_03003F2C
_0805E520: .4byte gUnknown_08499594
_0805E524: .4byte gUnknown_030040D8
_0805E528:
	movs r5, #0
_0805E52A:
	ldr r0, _0805E550 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0805E554
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r1, r5, #1
	adds r1, r1, r0
	cmp r1, #0xa
	bgt _0805E56C
	b _0805E558
	.align 2, 0
_0805E550: .4byte gUnknown_030040D8
_0805E554:
	cmp r5, #0xa
	bgt _0805E56C
_0805E558:
	mov r2, sb
	asrs r0, r2, #0x10
	mov r3, sl
	asrs r1, r3, #0x10
	movs r2, #0
	str r2, [sp]
	movs r2, #0xa
	movs r3, #0
	bl sub_0805D648
_0805E56C:
	movs r0, #0x80
	lsls r0, r0, #9
	add r8, r0
	adds r6, #1
	ldr r2, _0805E5A4 @ =gUnknown_0816DA70
	ldr r0, _0805E5A8 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r6, r0
	bge _0805E582
	b _0805E476
_0805E582:
	ldr r7, [sp, #4]
_0805E584:
	ldr r1, _0805E5A4 @ =gUnknown_0816DA70
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bge _0805E592
	b _0805E460
_0805E592:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E5A4: .4byte gUnknown_0816DA70
_0805E5A8: .4byte gUnknown_08499590

