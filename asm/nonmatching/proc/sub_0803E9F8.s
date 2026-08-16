	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E9F8
sub_0803E9F8: @ 0x0803E9F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0803EAC4
	adds r0, r1, #0
	bl sub_0801F92C
	adds r0, r4, #0
	bl sub_0801F838
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x1c
	cmp r1, #3
	beq _0803EA44
	cmp r1, #3
	bgt _0803EA2C
	cmp r1, #1
	beq _0803EA36
	b _0803EAC4
_0803EA2C:
	cmp r1, #4
	beq _0803EA78
	cmp r1, #5
	beq _0803EAB4
	b _0803EAC4
_0803EA36:
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	adds r2, r6, #0
	bl sub_0801FD30
	movs r0, #1
	b _0803EAC6
_0803EA44:
	lsrs r0, r0, #0x1c
	ldrb r1, [r5, #3]
	lsrs r1, r1, #6
	bl sub_0803E7C0
	ldrb r4, [r5]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
	ldrb r1, [r5, #3]
	lsrs r1, r1, #6
	bl sub_0803E7E4
	ldrb r1, [r5, #1]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r2, [r5, #3]
	lsrs r2, r2, #6
	str r6, [sp]
	adds r0, r4, #0
	movs r3, #0xa
	b _0803EAA8
_0803EA78:
	ldrb r0, [r5]
	ldr r4, _0803EAB0 @ =gUnknown_0849F698
	ldrb r2, [r5, #3]
	lsls r2, r2, #0x18
	lsrs r1, r2, #0x1e
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r5, #1]
	lsrs r3, r2, #0x1e
	lsls r3, r3, #1
	adds r3, #1
	lsls r3, r3, #2
	adds r3, r3, r4
	ldr r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x1e
	str r6, [sp]
	movs r3, #4
_0803EAA8:
	bl sub_0801FAC4
	movs r0, #1
	b _0803EAC6
	.align 2, 0
_0803EAB0: .4byte gUnknown_0849F698
_0803EAB4:
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	adds r1, #3
	adds r2, r6, #0
	bl sub_0801FCE0
	movs r0, #1
	b _0803EAC6
_0803EAC4:
	movs r0, #0
_0803EAC6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

