	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A5B8
sub_0806A5B8: @ 0x0806A5B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0x1f
	ldr r0, _0806A65C @ =gUnknown_030020C0
	mov sl, r0
_0806A5C8:
	ldr r2, _0806A660 @ =gUnknown_0200B5F4
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r1, #1
	mov sb, r2
	cmp r0, #0
	beq _0806A642
	movs r6, #0xf
	lsls r0, r1, #4
	mov r8, r0
	ldr r7, _0806A664 @ =gUnknown_0200B614
	ldr r2, _0806A660 @ =gUnknown_0200B5F4
	adds r1, r1, r2
	mov ip, r1
_0806A5E8:
	mov r1, r8
	adds r0, r1, r6
	lsls r5, r0, #1
	adds r3, r5, r0
	adds r1, r3, r7
	mov r2, ip
	ldrb r0, [r2]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0806A60E
	movs r4, #0x1f
_0806A60E:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _0806A616
	movs r4, #0
_0806A616:
	adds r0, r3, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, r3, #2
	adds r0, r0, r7
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r0, sl
	adds r3, r5, r0
	subs r1, #0x20
	lsls r1, r1, #0xa
	subs r2, #0x20
	lsls r2, r2, #5
	adds r1, r1, r2
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r3]
	subs r6, #1
	cmp r6, #0
	bge _0806A5E8
_0806A642:
	mov r1, sb
	cmp r1, #0
	bge _0806A5C8
	bl sub_080135A4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A65C: .4byte gUnknown_030020C0
_0806A660: .4byte gUnknown_0200B5F4
_0806A664: .4byte gUnknown_0200B614

