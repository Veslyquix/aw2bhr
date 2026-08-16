	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080348B4
sub_080348B4: @ 0x080348B4
	push {r4, r5, r6, r7, lr}
	ldr r1, _08034904 @ =gUnknown_03003FC0
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803492E
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _0803492E
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _0803492E
	movs r7, #0
	movs r5, #0
	movs r4, #1
	ldr r6, _08034908 @ =gUnknown_08499598
_080348D6:
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08034924
	cmp r5, #0
	beq _0803490C
	ldr r0, [r6]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	bne _08034924
	adds r0, r1, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r7, r0
	beq _08034924
	movs r0, #1
	b _08034930
	.align 2, 0
_08034904: .4byte gUnknown_03003FC0
_08034908: .4byte gUnknown_08499598
_0803490C:
	ldr r0, [r6]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	bne _08034924
	adds r0, r1, #0
	adds r0, #0x2a
	ldrb r7, [r0]
	movs r5, #1
_08034924:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _080348D6
_0803492E:
	movs r0, #0
_08034930:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

