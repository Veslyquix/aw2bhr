	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080139E0
sub_080139E0: @ 0x080139E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0x1f
_080139EC:
	ldr r0, _08013ABC @ =gUnknown_0200B5F4
	adds r2, r1, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r3, r1, #1
	mov sb, r3
	cmp r0, #0
	beq _08013AA2
	movs r7, #0xf
	lsls r1, r1, #4
	mov r8, r1
	ldr r4, _08013AC0 @ =gUnknown_0200B614
	mov ip, r4
	adds r6, r2, #0
	ldr r0, _08013AC4 @ =gUnknown_030020C0
	mov sl, r0
_08013A0C:
	mov r3, r8
	adds r1, r3, r7
	lsls r5, r1, #1
	adds r1, r5, r1
	mov r4, ip
	adds r2, r1, r4
	ldrb r0, [r6]
	ldrb r3, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	adds r0, r1, #1
	adds r3, r0, r4
	ldrb r0, [r6]
	ldrb r4, [r3]
	adds r0, r0, r4
	strb r0, [r3]
	adds r1, #2
	add r1, ip
	ldrb r0, [r6]
	ldrb r4, [r1]
	adds r0, r0, r4
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08013A4A
	movs r4, #0x1f
_08013A4A:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _08013A52
	movs r4, #0
_08013A52:
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08013A64
	movs r3, #0x1f
_08013A64:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _08013A6C
	movs r3, #0
_08013A6C:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08013A7E
	movs r1, #0x1f
_08013A7E:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _08013A86
	movs r1, #0
_08013A86:
	mov r0, sl
	adds r2, r5, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #6
	lsls r0, r3, #0x10
	asrs r0, r0, #0xb
	adds r1, r1, r0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r2]
	subs r7, #1
	cmp r7, #0
	bge _08013A0C
_08013AA2:
	mov r1, sb
	cmp r1, #0
	bge _080139EC
	bl sub_080135A4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013ABC: .4byte gUnknown_0200B5F4
_08013AC0: .4byte gUnknown_0200B614
_08013AC4: .4byte gUnknown_030020C0

