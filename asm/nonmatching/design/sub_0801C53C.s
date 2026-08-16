	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C53C
sub_0801C53C: @ 0x0801C53C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	cmp r7, #0
	beq _0801C61E
	ldr r0, [r7]
	cmp r0, #0
	beq _0801C61E
	ldr r0, [r7, #0x10]
	ldrh r6, [r0]
	adds r5, r0, #2
	adds r2, r6, #0
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, #2
	adds r0, r0, r1
	mov sl, r0
	movs r0, #0
	str r0, [sp]
	subs r6, #1
	adds r1, r7, #0
	adds r1, #0x20
	str r1, [sp, #4]
	cmp r2, #0
	ble _0801C614
	ldr r2, _0801C630 @ =gUnknown_0848B5C4
	mov r8, r2
	movs r3, #0xc0
	lsls r3, r3, #8
	mov sb, r3
_0801C582:
	ldr r0, _0801C634 @ =gUnknown_030030CC
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801C606
	mov r4, sl
	ldrh r0, [r4]
	ldr r1, _0801C638 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, [r7, #0x24]
	adds r0, r0, r1
	ldrh r2, [r7, #0x22]
	ldr r1, _0801C638 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r3, [sp]
	ldr r4, _0801C63C @ =0x06010000
	adds r2, r3, r4
	adds r1, r1, r2
	ldrh r2, [r5]
	mov r3, sb
	ands r3, r2
	lsrs r3, r3, #0xc
	ldrh r4, [r5, #2]
	mov r2, sb
	ands r2, r4
	lsrs r2, r2, #0xe
	adds r3, r3, r2
	lsls r3, r3, #1
	mov r4, r8
	adds r2, r3, r4
	ldrb r4, [r2]
	adds r3, #1
	add r3, r8
	ldrb r2, [r3]
	lsls r2, r2, #5
	muls r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_08011E54
	ldrh r0, [r5]
	mov r1, sb
	ands r1, r0
	lsrs r1, r1, #0xc
	ldrh r2, [r5, #2]
	mov r0, sb
	ands r0, r2
	lsrs r0, r0, #0xe
	adds r1, r1, r0
	lsls r1, r1, #1
	mov r2, r8
	adds r0, r1, r2
	ldrb r2, [r0]
	adds r1, #1
	add r1, r8
	ldrb r0, [r1]
	muls r0, r2, r0
	ldr r3, _0801C638 @ =0x000003FF
	ands r0, r3
	lsls r0, r0, #5
	ldr r4, [sp]
	adds r4, r4, r0
	str r4, [sp]
_0801C606:
	adds r5, #6
	movs r0, #2
	add sl, r0
	adds r0, r6, #0
	subs r6, #1
	cmp r0, #0
	bgt _0801C582
_0801C614:
	ldr r2, [sp, #4]
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
_0801C61E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C630: .4byte gUnknown_0848B5C4
_0801C634: .4byte gUnknown_030030CC
_0801C638: .4byte 0x000003FF
_0801C63C: .4byte 0x06010000

