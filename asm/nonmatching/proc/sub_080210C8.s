	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080210C8
sub_080210C8: @ 0x080210C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sb, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #1
	beq _080210FE
	cmp r3, #1
	ble _080211BC
	cmp r3, #2
	beq _08021182
	cmp r3, #3
	beq _08021148
	b _080211BC
_080210FE:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	ldr r5, _0802113C @ =gUnknown_08499590
	ldr r3, _08021140 @ =gUnknown_03004070
	ldrh r3, [r3]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r4, r4, #5
	adds r4, r4, r3
	lsls r4, r4, #3
	ldr r3, _08021144 @ =0x00001E42
	adds r4, r4, r3
	ldr r3, [r5]
	adds r3, r3, r4
	mov r5, sb
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	ldr r5, [sp, #0x28]
	lsls r4, r5, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	bl sub_08020EDC
	b _080211BC
	.align 2, 0
_0802113C: .4byte gUnknown_08499590
_08021140: .4byte gUnknown_03004070
_08021144: .4byte 0x00001E42
_08021148:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	ldr r5, _080211CC @ =gUnknown_08499590
	ldr r3, _080211D0 @ =gUnknown_03004070
	ldrh r3, [r3]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r4, r4, #5
	adds r4, r4, r3
	lsls r4, r4, #3
	ldr r3, _080211D4 @ =0x00001E42
	adds r4, r4, r3
	ldr r3, [r5]
	adds r3, r3, r4
	mov r5, sb
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	ldr r5, [sp, #0x28]
	lsls r4, r5, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	bl sub_08020EDC
_08021182:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	ldr r5, _080211CC @ =gUnknown_08499590
	ldr r3, _080211D8 @ =gUnknown_03004088
	ldrh r3, [r3]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r4, r4, #5
	adds r4, r4, r3
	lsls r4, r4, #3
	ldr r3, _080211D4 @ =0x00001E42
	adds r4, r4, r3
	ldr r3, [r5]
	adds r3, r3, r4
	mov r5, sb
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	ldr r5, [sp, #0x28]
	lsls r4, r5, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	bl sub_08020EDC
_080211BC:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080211CC: .4byte gUnknown_08499590
_080211D0: .4byte gUnknown_03004070
_080211D4: .4byte 0x00001E42
_080211D8: .4byte gUnknown_03004088

