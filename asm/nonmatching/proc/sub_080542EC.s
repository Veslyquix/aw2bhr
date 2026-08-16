	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080542EC
sub_080542EC: @ 0x080542EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r2, _080543CC @ =gUnknown_02029A10
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r7, r1
	adds r0, r0, r1
	adds r4, r0, r2
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, r6
	beq _080543C0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080543C0
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	cmp r0, r6
	beq _08054344
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054344
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	ldr r1, _080543D0 @ =gUnknown_02029BA8
	lsls r2, r7, #5
	adds r1, #0x10
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
_08054344:
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_080505A4
	ldr r0, _080543D4 @ =gUnknown_08136134
	ldr r1, [r0]
	lsls r2, r7, #4
	adds r1, #2
	adds r1, r2, r1
	ldrh r3, [r1]
	mov r8, r0
	mov ip, r2
	cmp r3, #0xf
	beq _0805436C
	cmp r3, #0x12
	beq _0805436C
	ldr r6, _080543D8 @ =gUnknown_08136138
	lsls r5, r7, #2
	cmp r3, #3
	bne _080543B2
_0805436C:
	ldr r3, _080543DC @ =gUnknown_085D6C88
	ldr r6, _080543D8 @ =gUnknown_08136138
	ldr r0, [r6]
	lsls r5, r7, #2
	adds r4, r5, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r0, [r4, #0x1a]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	mov r0, r8
	ldr r2, [r0]
	adds r0, r2, #4
	add r0, ip
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r2, #2
	add r2, ip
	ldrh r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r3, #0xc
	adds r1, r1, r3
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_0803B48C
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
_080543B2:
	ldr r0, [r6]
	adds r1, r5, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
_080543C0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080543CC: .4byte gUnknown_02029A10
_080543D0: .4byte gUnknown_02029BA8
_080543D4: .4byte gUnknown_08136134
_080543D8: .4byte gUnknown_08136138
_080543DC: .4byte gUnknown_085D6C88

