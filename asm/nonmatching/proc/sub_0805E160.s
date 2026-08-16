	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E160
sub_0805E160: @ 0x0805E160
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _0805E1D8 @ =gUnknown_03003F20
	ldr r7, [r0]
	ldr r4, _0805E1DC @ =gUnknown_0816DA5C
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r1, _0805E1E0 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r2, _0805E1E4 @ =gUnknown_0816DA60
	ldr r0, [r2]
	ldr r3, [r0]
	ldrb r1, [r3, #9]
	movs r0, #0xc0
	ands r0, r1
	mov r8, r4
	mov sb, r2
	cmp r0, #0
	beq _0805E192
	b _0805E298
_0805E192:
	ldr r5, _0805E1E8 @ =gUnknown_0816DA64
	ldr r4, [r5]
	ldrb r0, [r3, #2]
	ldrb r1, [r3, #3]
	ldrb r2, [r3]
	movs r3, #1
	str r3, [sp]
	ldr r4, [r4]
	movs r3, #0x78
	bl _call_via_r4
	movs r0, #0x79
	bl sub_0801FD9C
	adds r0, r7, #0
	bl sub_0805A514
_0805E1B4:
	ldr r1, _0805E1EC @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r4, _0805E1F0 @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #4]
	add r6, sp, #4
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_08059C00
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805E1F4
	bl sub_0805E2AC
	b _0805E29C
	.align 2, 0
_0805E1D8: .4byte gUnknown_03003F20
_0805E1DC: .4byte gUnknown_0816DA5C
_0805E1E0: .4byte 0x00002852
_0805E1E4: .4byte gUnknown_0816DA60
_0805E1E8: .4byte gUnknown_0816DA64
_0805E1EC: .4byte 0xFFFF0000
_0805E1F0: .4byte 0x0000270F
_0805E1F4:
	ldr r3, _0805E274 @ =gUnknown_03004730
	mov r2, r8
	ldr r0, [r2]
	ldr r2, [r0]
	ldrh r1, [r6, #2]
	lsls r1, r1, #1
	ldr r4, _0805E278 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #4
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r2, #0x12
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	add r0, sp, #4
	ldrh r0, [r0]
	ldrh r1, [r6, #2]
	add r2, sp, #4
	bl sub_0805ACA8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _0805E1B4
	ldr r3, [r5]
	add r0, sp, #4
	ldrh r0, [r0]
	ldrh r1, [r6, #2]
	mov r2, sb
	ldr r5, [r2]
	ldr r2, [r5]
	ldrb r2, [r2]
	str r4, [sp]
	ldr r4, [r3]
	movs r3, #0x78
	bl _call_via_r4
	ldr r2, _0805E27C @ =gUnknown_03003340
	ldr r0, [r5]
	ldrb r1, [r0, #3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r0, #2]
	ldr r1, [r1]
	adds r1, r1, r2
	movs r4, #0
	ldrsb r4, [r1, r4]
	bl sub_08058224
	cmp r4, r0
	ble _0805E280
	add r0, sp, #4
	bl sub_080591E4
	b _0805E29C
	.align 2, 0
_0805E274: .4byte gUnknown_03004730
_0805E278: .4byte 0x0000417A
_0805E27C: .4byte gUnknown_03003340
_0805E280:
	add r0, sp, #4
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r2, #2
	ldrsh r1, [r6, r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
	b _0805E29C
_0805E298:
	bl sub_0805B3F4
_0805E29C:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

