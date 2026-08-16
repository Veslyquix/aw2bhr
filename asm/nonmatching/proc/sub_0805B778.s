	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B778
sub_0805B778: @ 0x0805B778
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, _0805B7FC @ =gUnknown_030013EC
	ldr r5, _0805B800 @ =gUnknown_0816D9C4
	ldr r0, [r5]
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r4, [r4]
	movs r3, #0x78
	bl _call_via_r4
	bl sub_0805B980
	mov r8, r5
	ldr r7, _0805B804 @ =gUnknown_0816D9C8
	ldr r6, _0805B808 @ =gUnknown_0816D9CC
_0805B7A4:
	ldr r0, [r7]
	ldr r0, [r0]
	ldr r2, _0805B80C @ =0xFFFF0000
	ldr r1, [sp, #4]
	ands r1, r2
	ldr r4, _0805B810 @ =0x0000270F
	orrs r1, r4
	str r1, [sp, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_08059C00
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805B7C8
	bl sub_0805F7B8
_0805B7C8:
	ldr r1, [r6]
	ldrh r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	add r1, sp, #4
	ldrh r1, [r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl sub_08058224
	cmp r4, r0
	ble _0805B7A4
	add r0, sp, #4
	bl sub_080591E4
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B7FC: .4byte gUnknown_030013EC
_0805B800: .4byte gUnknown_0816D9C4
_0805B804: .4byte gUnknown_0816D9C8
_0805B808: .4byte gUnknown_0816D9CC
_0805B80C: .4byte 0xFFFF0000
_0805B810: .4byte 0x0000270F

