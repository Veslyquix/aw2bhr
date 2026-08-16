	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805D888
sub_0805D888: @ 0x0805D888
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp, #4]
	mov r8, r2
	ldr r0, _0805D9C8 @ =gUnknown_030033EC
	ldrh r0, [r0]
	movs r1, #1
	bl sub_0805C290
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _0805D8CC
	movs r4, #1
	str r4, [sp, #0xc]
	ldr r0, _0805D9CC @ =gUnknown_08499594
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [sp, #0x10]
_0805D8CC:
	bl sub_0805E5AC
	ldr r4, _0805D9D0 @ =gUnknown_030040D8
	ldr r1, [r4]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_0804236C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805D8F6
	ldr r1, [r4]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldr r2, [sp, #8]
	str r2, [sp]
	movs r2, #3
	movs r3, #0
	bl sub_0805D648
_0805D8F6:
	ldr r0, [r4]
	bl sub_080202A4
	movs r6, #0
	ldr r1, _0805D9D4 @ =gUnknown_08499590
	ldr r0, [r1]
	ldr r3, [sp, #8]
	ldrh r0, [r0, #2]
	cmp r3, r0
	blt _0805D90C
	b _0805DA30
_0805D90C:
	adds r7, r1, #0
	mov sb, r6
_0805D910:
	movs r4, #0
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805D91C
	b _0805DA20
_0805D91C:
	ldr r1, _0805D9D8 @ =gUnknown_03003340
	lsls r0, r6, #2
	adds r5, r0, r1
	movs r0, #0x1f
	mov sl, r0
_0805D926:
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805DA16
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_0804236C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805D9E8
	ldr r1, [r7]
	ldr r2, _0805D9DC @ =0x0000417A
	adds r0, r1, r2
	add r0, sb
	ldrh r0, [r0]
	adds r2, r0, r4
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D9E8
	ldr r3, _0805D9E0 @ =0x00001432
	adds r0, r1, r3
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r0, sl
	ands r0, r1
	cmp r0, #8
	bne _0805D980
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #8
	cmp r0, r8
	bgt _0805D9C0
_0805D980:
	ldr r1, [r7]
	ldr r2, _0805D9DC @ =0x0000417A
	adds r0, r1, r2
	add r0, sb
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r3, _0805D9E0 @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	mov r0, sl
	ands r0, r1
	ldr r1, _0805D9E4 @ =gUnknown_085767F2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D9B2
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #4
	cmp r0, r8
	bgt _0805D9C0
_0805D9B2:
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	ble _0805DA16
_0805D9C0:
	str r4, [sp, #4]
	str r6, [sp, #8]
	mov r8, r0
	b _0805DA16
	.align 2, 0
_0805D9C8: .4byte gUnknown_030033EC
_0805D9CC: .4byte gUnknown_08499594
_0805D9D0: .4byte gUnknown_030040D8
_0805D9D4: .4byte gUnknown_08499590
_0805D9D8: .4byte gUnknown_03003340
_0805D9DC: .4byte 0x0000417A
_0805D9E0: .4byte 0x00001432
_0805D9E4: .4byte gUnknown_085767F2
_0805D9E8:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _0805DA16
	ldr r2, [r7]
	ldr r3, _0805DA54 @ =0x0000417A
	adds r0, r2, r3
	add r0, sb
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r1, _0805DA58 @ =0x00001432
	adds r0, r2, r1
	adds r0, r0, r3
	ldrb r1, [r0]
	mov r0, sl
	ands r0, r1
	cmp r0, #0x11
	bne _0805DA16
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805DA5C
_0805DA16:
	adds r4, #1
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805D926
_0805DA20:
	movs r2, #2
	add sb, r2
	adds r6, #1
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r6, r0
	bge _0805DA30
	b _0805D910
_0805DA30:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #4]
	cmp r3, r0
	beq _0805DA72
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldr r4, [sp, #8]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	movs r2, #3
	movs r3, #0
	bl sub_0805D648
	b _0805DA72
	.align 2, 0
_0805DA54: .4byte 0x0000417A
_0805DA58: .4byte 0x00001432
_0805DA5C:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #0x10]
	ldrb r3, [r2, #2]
	ldrb r2, [r2, #3]
	str r2, [sp]
	movs r2, #0x14
	bl sub_0805D648
_0805DA72:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

