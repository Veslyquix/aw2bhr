	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078358
sub_08078358: @ 0x08078358
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _080783B4 @ =gUnknown_08615974
	ldr r1, _080783B8 @ =gUnknown_0202FE0E
	mov sb, r1
	adds r1, r0, #2
	mov r8, r1
	adds r4, r0, #0
_08078370:
	lsls r5, r6, #2
	ldrb r0, [r4]
	bl sub_0803CBD8
	cmp r0, #0
	beq _080783A0
	ldrb r0, [r4, #1]
	bl sub_0803CBD8
	cmp r0, #0
	bne _080783A0
	movs r0, #2
	ldrsb r0, [r4, r0]
	add r0, sb
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080783A0
	mov r1, r8
	adds r0, r5, r1
	adds r1, r7, #0
	bl sub_08074AAC
_080783A0:
	adds r4, #4
	adds r6, #1
	cmp r6, #3
	ble _08078370
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080783B4: .4byte gUnknown_08615974
_080783B8: .4byte gUnknown_0202FE0E

