	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A8DC
sub_0802A8DC: @ 0x0802A8DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl sub_0803EED4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r7, #0x1f
	ands r7, r4
	adds r0, r4, #0
	bl sub_080249C8
	adds r6, r0, #0
	adds r0, r4, #0
	bl sub_08024984
	mov sl, r0
	adds r0, r7, #0
	bl sub_0802A85C
	ldr r1, _0802A9E4 @ =0x06013940
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011E54
	ldr r0, _0802A9E8 @ =gUnknown_08090B90
	mov sb, r0
	ldr r1, [r0]
	ldr r2, [sp, #0x28]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, _0802A9EC @ =gUnknown_08090B94
	ldr r2, [r4]
	ldr r1, [sp]
	adds r0, r1, r0
	ldrb r1, [r2, #0x14]
	adds r0, r0, r1
	ldr r1, _0802A9F0 @ =0x000001FF
	ands r0, r1
	ldrb r1, [r2, #0x15]
	ldr r2, [sp, #4]
	adds r1, r2, r1
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	ldr r2, _0802A9F4 @ =gUnknown_0849A240
	ldr r3, _0802A9F8 @ =0x000011CA
	bl sub_0801BD00
	ldr r0, _0802A9FC @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r5, r5, #1
	ldr r2, _0802AA00 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	add r0, r8
	ldr r2, _0802AA04 @ =0x0000234A
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r5, sb
	cmp r0, #0
	bne _0802A97A
	cmp r7, #8
	beq _0802A97A
	movs r6, #0
_0802A97A:
	adds r0, r7, #0
	mov r1, sl
	bl sub_0802A880
	ldr r1, _0802AA08 @ =0x06013CC0
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011E54
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_0802A8AC
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r5]
	ldr r2, [sp, #0x28]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [r4]
	ldr r1, [sp]
	adds r0, r1, r0
	ldrb r1, [r2, #0x12]
	adds r0, r0, r1
	ldr r1, _0802A9F0 @ =0x000001FF
	ands r0, r1
	ldrb r1, [r2, #0x13]
	ldr r2, [sp, #4]
	adds r1, r2, r1
	movs r2, #0xff
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	ldr r2, _0802AA0C @ =gUnknown_0849A1F0
	ldr r3, _0802AA10 @ =0x000061E6
	bl sub_0801BD00
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A9E4: .4byte 0x06013940
_0802A9E8: .4byte gUnknown_08090B90
_0802A9EC: .4byte gUnknown_08090B94
_0802A9F0: .4byte 0x000001FF
_0802A9F4: .4byte gUnknown_0849A240
_0802A9F8: .4byte 0x000011CA
_0802A9FC: .4byte gUnknown_08499590
_0802AA00: .4byte 0x0000417A
_0802AA04: .4byte 0x0000234A
_0802AA08: .4byte 0x06013CC0
_0802AA0C: .4byte gUnknown_0849A1F0
_0802AA10: .4byte 0x000061E6

