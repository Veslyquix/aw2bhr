	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026290
sub_08026290: @ 0x08026290
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _080262F8 @ =gUnknown_08090A60
	ldr r0, [r4]
	ldrb r0, [r0, #2]
	bl sub_0802490C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #1
	cmp r5, r8
	bhi _08026330
_080262B0:
	ldr r2, _080262FC @ =gUnknown_03003FC0
	adds r3, r2, #0
	adds r3, #0x38
	adds r1, r5, r3
	ldrb r0, [r1]
	adds r4, r5, #1
	mov sb, r4
	cmp r0, #0
	bne _08026326
	movs r0, #2
	strb r0, [r1]
	mov r4, r8
	adds r4, #1
	adds r6, r2, #0
	adds r6, #0x3d
	adds r7, r5, r6
	mov sl, r3
_080262D2:
	bl sub_08026254
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #1
	cmp r1, r4
	bge _08026320
	cmp r5, #1
	beq _08026300
	ldr r2, _080262FC @ =gUnknown_03003FC0
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #0
	beq _08026300
	adds r0, r2, #0
	adds r0, #0x3e
	b _0802631A
	.align 2, 0
_080262F8: .4byte gUnknown_08090A60
_080262FC: .4byte gUnknown_03003FC0
_08026300:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r4
	bge _08026320
	cmp r5, r1
	beq _08026300
	mov r2, sl
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08026300
	adds r0, r1, r6
_0802631A:
	ldrb r0, [r0]
	cmp r0, r3
	bne _08026300
_08026320:
	cmp r1, r4
	bne _080262D2
	strb r3, [r7]
_08026326:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r8
	bls _080262B0
_08026330:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

