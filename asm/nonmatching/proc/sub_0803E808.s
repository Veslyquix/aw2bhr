	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E808
sub_0803E808: @ 0x0803E808
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	str r3, [sp, #4]
	ldr r4, [sp, #0x40]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, _0803E89C @ =gUnknown_08091300
	mov sb, r1
	ldr r2, [r1]
	mov r8, r2
	ldr r0, [r2]
	ldr r1, _0803E8A0 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	movs r0, #0xff
	bl sub_0801F838
	ldr r0, [sp, #4]
	adds r1, r4, #0
	bl sub_0803E7C0
	adds r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, [sp, #4]
	adds r1, r4, #0
	bl sub_0803E7E4
	adds r6, r6, r0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _0803E8A4 @ =gUnknown_0849F6B8
	ldr r2, [sp, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r3, [r0]
	ldr r0, [sp, #0x14]
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0801FAC4
	movs r3, #0
	mov r1, r8
	ldr r0, [r1]
	mov sl, sb
	ldr r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _0803E88C
	b _0803E9B2
_0803E88C:
	movs r6, #0
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	adds r4, r3, #1
	str r4, [sp, #0x18]
	b _0803E99C
	.align 2, 0
_0803E89C: .4byte gUnknown_08091300
_0803E8A0: .4byte 0x00002852
_0803E8A4: .4byte gUnknown_0849F6B8
_0803E8A8:
	ldr r1, _0803E9C0 @ =gUnknown_03003340
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0803E994
	ldr r2, [r2]
	mov sb, r2
	ldr r1, [r2]
	lsls r7, r3, #1
	ldr r0, _0803E9C4 @ =0x0000417A
	mov r8, r0
	adds r0, r1, r0
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r6
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	cmp r1, #0
	beq _0803E994
	ldr r4, _0803E9C8 @ =gUnknown_030033EC
	ldrh r0, [r4]
	lsrs r1, r1, #0x1e
	adds r1, #1
	str r3, [sp, #0x1c]
	bl sub_08026F28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x1c]
	cmp r0, #1
	beq _0803E994
	ldrb r0, [r4]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	bl sub_08020DBC
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x1c]
	cmp r0, #0
	beq _0803E994
	mov r2, sb
	ldr r1, [r2]
	mov r4, r8
	adds r0, r1, r4
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r6
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r4, _0803E9CC @ =gUnknown_08499594
	ldr r1, [r4]
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, #0x18
	bne _0803E948
	ldrb r1, [r5, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0803E994
	adds r0, r2, #0
	bl sub_080257C0
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x1c]
	cmp r0, #0
	beq _0803E994
_0803E948:
	ldrb r4, [r5, #4]
	lsls r4, r4, #0x19
	lsrs r4, r4, #0x19
	ldr r2, _0803E9D0 @ =gUnknown_085D5ABC
	ldrb r1, [r5]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	movs r1, #0xa
	str r3, [sp, #0x1c]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	muls r4, r0, r4
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #8]
	cmp r0, r4
	bhi _0803E994
	str r4, [sp, #8]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r2, sb
	ldr r1, [r2]
	mov r4, r8
	adds r0, r1, r4
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r6
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r1, [r1]
	str r1, [sp, #0x14]
_0803E994:
	adds r6, #1
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
_0803E99C:
	ldrh r0, [r0]
	cmp r6, r0
	blt _0803E8A8
	ldr r3, [sp, #0x18]
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r3, r0
	bge _0803E9B2
	b _0803E88C
_0803E9B2:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne _0803E9D4
	bl sub_0803E554
	b _0803E9E8
	.align 2, 0
_0803E9C0: .4byte gUnknown_03003340
_0803E9C4: .4byte 0x0000417A
_0803E9C8: .4byte gUnknown_030033EC
_0803E9CC: .4byte gUnknown_08499594
_0803E9D0: .4byte gUnknown_085D5ABC
_0803E9D4:
	movs r3, #0x1e
	ldr r4, [sp, #4]
	cmp r4, #3
	bne _0803E9DE
	movs r3, #0x32
_0803E9DE:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl sub_0803E560
_0803E9E8:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

