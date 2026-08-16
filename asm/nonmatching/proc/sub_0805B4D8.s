	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B4D8
sub_0805B4D8: @ 0x0805B4D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	movs r7, #0
	ldr r4, _0805B53C @ =gUnknown_02029ED8
	lsls r3, r0, #5
	ldr r2, _0805B540 @ =gUnknown_0816D9C0
	ldr r0, [r2]
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r0, r3, r0
	adds r0, r0, r4
	ldrb r5, [r0]
	cmp r5, #0xff
	beq _0805B5AA
	mov sb, r4
_0805B508:
	lsls r2, r5, #3
	mov r1, r8
	subs r0, r3, r1
	lsls r0, r0, #5
	adds r2, r2, r0
	ldr r0, _0805B544 @ =gUnknown_030033EC
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #0xa
	adds r2, r2, r1
	add r2, sb
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r4, [r0]
	cmp r4, #0xfe
	bne _0805B548
	adds r7, #1
	cmp r7, #0x1f
	bgt _0805B5AA
	adds r0, r7, r3
	adds r0, r0, r1
	add r0, sb
	ldrb r5, [r0]
	b _0805B5A6
	.align 2, 0
_0805B53C: .4byte gUnknown_02029ED8
_0805B540: .4byte gUnknown_0816D9C0
_0805B544: .4byte gUnknown_030033EC
_0805B548:
	adds r0, r2, #0
	adds r0, #0x61
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldr r0, _0805B594 @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r6, [sp, #8]
	lsls r2, r6, #1
	ldr r6, _0805B598 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0805B59C @ =0x00001432
	adds r1, r1, r2
	adds r2, r1, r0
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #8
	bne _0805B5A4
	ldr r0, _0805B5A0 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldrb r1, [r2]
	str r3, [sp, #4]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	ldr r3, [sp, #4]
	cmp r0, #0
	bne _0805B5A4
	mov r6, sl
	str r4, [r6]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	str r0, [r1]
	movs r0, #1
	b _0805B5AC
	.align 2, 0
_0805B594: .4byte gUnknown_08499590
_0805B598: .4byte 0x0000417A
_0805B59C: .4byte 0x00001432
_0805B5A0: .4byte gUnknown_03003F38
_0805B5A4:
	adds r5, #1
_0805B5A6:
	cmp r5, #0xff
	bne _0805B508
_0805B5AA:
	movs r0, #0
_0805B5AC:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

