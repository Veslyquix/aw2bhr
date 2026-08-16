	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D67C
sub_0802D67C: @ 0x0802D67C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r6, #0
	movs r7, #0
	ldr r1, _0802D700 @ =gUnknown_08090C08
	ldr r0, [r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _0802D744
	ldr r0, _0802D704 @ =gUnknown_02023830
	mov r8, r0
	mov sl, r2
_0802D6A8:
	ldr r0, [r1]
	adds r0, r7, r0
	ldrb r5, [r0]
	ldr r1, _0802D708 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	muls r0, r5, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _0802D72E
	ldr r4, _0802D70C @ =gUnknown_08090C0C
	cmp r5, #8
	bne _0802D6D4
	ldr r0, _0802D710 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_080261E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802D72E
_0802D6D4:
	ldr r0, [r4]
	ldrh r0, [r0]
	ldr r1, _0802D714 @ =gUnknown_08499598
	ldr r1, [r1]
	lsls r4, r0, #4
	subs r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r1
	adds r1, r5, #0
	bl sub_08042C9C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, [r4]
	cmp r0, r1
	bhs _0802D718
	lsls r0, r6, #2
	add r0, r8
	movs r1, #2
	b _0802D71E
	.align 2, 0
_0802D700: .4byte gUnknown_08090C08
_0802D704: .4byte gUnknown_02023830
_0802D708: .4byte gUnknown_085D5ABC
_0802D70C: .4byte gUnknown_08090C0C
_0802D710: .4byte gUnknown_030033EC
_0802D714: .4byte gUnknown_08499598
_0802D718:
	lsls r0, r6, #2
	add r0, r8
	movs r1, #0
_0802D71E:
	strb r1, [r0, #1]
	adds r1, r6, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #2
	add r1, r8
	strb r5, [r1]
_0802D72E:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0802D760 @ =gUnknown_08090C08
	ldr r0, [r1]
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sl
	bne _0802D6A8
_0802D744:
	ldr r0, _0802D764 @ =gUnknown_0300055A
	strh r6, [r0]
	ldr r1, _0802D768 @ =gUnknown_02023830
	lsls r0, r6, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D760: .4byte gUnknown_08090C08
_0802D764: .4byte gUnknown_0300055A
_0802D768: .4byte gUnknown_02023830

