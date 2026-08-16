	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039188
sub_08039188: @ 0x08039188
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08039250 @ =gUnknown_08090F2C
	ldr r0, [r1]
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x45
	movs r0, #0
	ldrsb r0, [r2, r0]
	mov sl, r1
	cmp r0, #0
	beq _0803923E
	ldrb r0, [r2]
	lsls r5, r0, #0x18
	cmp r5, #0
	blt _0803923E
	ldr r0, _08039254 @ =gUnknown_0849D5C4
	mov sb, r0
_080391B4:
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [r0]
	asrs r6, r5, #0x18
	adds r0, r1, #0
	adds r0, #0x20
	adds r0, r0, r6
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, #0x2c
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r2, #4
	lsls r0, r0, #4
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0x10
	bl sub_08039140
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039236
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_080390CC
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08039064
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r0, r0, r1
	add r0, sb
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r3, r1, #0
	orrs r3, r0
	ldr r0, _08039258 @ =gUnknown_08499590
	ldr r2, [r0]
	movs r0, #4
	ldrsh r1, [r2, r0]
	subs r1, r7, r1
	ldr r0, _0803925C @ =0x000001FF
	ands r1, r0
	movs r0, #6
	ldrsh r2, [r2, r0]
	mov r0, r8
	subs r2, r0, r2
	movs r0, #0xff
	ands r2, r0
	str r3, [sp]
	movs r0, #3
	ldr r3, _08039260 @ =gUnknown_0848B690
	bl sub_0801BEBC
_08039236:
	subs r0, r6, #1
	lsls r5, r0, #0x18
	cmp r5, #0
	bge _080391B4
_0803923E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039250: .4byte gUnknown_08090F2C
_08039254: .4byte gUnknown_0849D5C4
_08039258: .4byte gUnknown_08499590
_0803925C: .4byte 0x000001FF
_08039260: .4byte gUnknown_0848B690

