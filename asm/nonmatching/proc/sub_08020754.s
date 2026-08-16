	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020754
sub_08020754: @ 0x08020754
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0
	ldr r0, _080207E8 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	cmp r1, r2
	bge _08020814
	mov sl, r0
_08020770:
	movs r3, #0
	adds r7, r1, #1
	str r7, [sp]
	mov r0, sl
	ldrh r0, [r0]
	cmp r3, r0
	bge _0802080A
	ldr r2, _080207E8 @ =gUnknown_08499590
	ldr r4, [r2]
	lsls r6, r1, #1
	ldr r7, _080207EC @ =0x0000417A
	adds r0, r4, r7
	adds r0, r0, r6
	mov sb, r0
	ldr r0, _080207F0 @ =0x00001432
	adds r0, r0, r4
	mov r8, r0
	ldr r1, _080207F4 @ =0x0000051A
	adds r1, r1, r4
	mov ip, r1
_08020798:
	mov r2, sb
	ldrh r0, [r2]
	adds r2, r0, r3
	mov r7, r8
	adds r0, r7, r2
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #4
	beq _080207B0
	cmp r1, #0x13
	bne _080207FC
_080207B0:
	mov r0, ip
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080207D4
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r7, _080207F8 @ =gUnknown_08499594
	ldr r1, [r7]
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080207FC
_080207D4:
	ldr r2, _080207E8 @ =gUnknown_08499590
	ldr r0, [r2]
	ldr r7, _080207EC @ =0x0000417A
	adds r0, r0, r7
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r3
	adds r0, r5, r0
	movs r1, #0
	b _08020800
	.align 2, 0
_080207E8: .4byte gUnknown_08499590
_080207EC: .4byte 0x0000417A
_080207F0: .4byte 0x00001432
_080207F4: .4byte 0x0000051A
_080207F8: .4byte gUnknown_08499594
_080207FC:
	adds r0, r5, r2
	movs r1, #1
_08020800:
	strb r1, [r0]
	adds r3, #1
	ldrh r2, [r4]
	cmp r3, r2
	blt _08020798
_0802080A:
	ldr r1, [sp]
	mov r7, sl
	ldrh r7, [r7, #2]
	cmp r1, r7
	blt _08020770
_08020814:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

