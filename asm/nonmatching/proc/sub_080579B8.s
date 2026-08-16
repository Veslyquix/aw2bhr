	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080579B8
sub_080579B8: @ 0x080579B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r6, #0
	ldr r0, _08057A1C @ =gUnknown_085D6A48
	mov r8, r0
	ldr r0, _08057A20 @ =gUnknown_03004580
	adds r7, r0, #2
_080579CC:
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, r8
	ldrh r4, [r0, #2]
	lsls r4, r4, #1
	adds r4, r4, r6
	lsls r0, r6, #0x13
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sp
	bl sub_080576D4
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sp
	bl sub_0805772C
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sp
	bl sub_080577E4
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sp
	bl sub_08057860
	adds r7, #0x10
	adds r6, #1
	cmp r6, #1
	ble _080579CC
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057A1C: .4byte gUnknown_085D6A48
_08057A20: .4byte gUnknown_03004580

