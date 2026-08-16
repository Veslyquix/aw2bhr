	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055654
sub_08055654: @ 0x08055654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r5, #0
	mov sb, r0
	ldr r0, _080556B4 @ =gUnknown_08136154
	mov r8, r0
	ldr r0, [r0]
	ldrh r0, [r0]
	str r0, [sp, #8]
	ldr r1, _080556B8 @ =gUnknown_02029A10
	mov ip, r1
_08055688:
	movs r2, #0
	adds r6, r5, #1
	movs r7, #0xb4
	adds r4, r5, #0
	muls r4, r7, r4
	lsls r0, r5, #4
	ldr r1, _080556BC @ =gUnknown_03004584
	adds r3, r0, r1
	lsls r0, r5, #1
	mov r7, sp
	adds r1, r7, r0
_0805569E:
	ldr r0, [sp, #8]
	cmp r0, r5
	bne _080556C0
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	add r0, ip
	ldrb r0, [r0]
	b _080556CC
	.align 2, 0
_080556B4: .4byte gUnknown_08136154
_080556B8: .4byte gUnknown_02029A10
_080556BC: .4byte gUnknown_03004584
_080556C0:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	add r0, ip
	ldrb r0, [r0, #1]
_080556CC:
	cmp r0, #0
	beq _080556DC
	ldrh r0, [r3]
	cmp r0, #0
	beq _080556DC
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080556DC:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #4
	bls _0805569E
	lsls r0, r6, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #1
	bls _08055688
	mov r1, sl
	cmp r1, #2
	bne _08055702
	mov r7, r8
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r0, #0
	bne _08055702
	mov r1, sb
	strh r0, [r1]
_08055702:
	ldr r7, [sp, #4]
	cmp r7, #2
	bne _08055718
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r0, #1
	bne _08055718
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
_08055718:
	mov r7, sl
	cmp r7, #2
	bne _0805572E
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r0, #1
	bne _0805572E
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
_0805572E:
	ldr r7, [sp, #4]
	cmp r7, #2
	bne _08055742
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r0, #0
	bne _08055742
	mov r7, sb
	strh r0, [r7]
_08055742:
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #0
	bl sub_08055768
	mov r0, sb
	ldrh r1, [r0]
	movs r0, #1
	bl sub_08055768
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

