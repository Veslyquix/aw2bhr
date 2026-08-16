	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805EF9C
sub_0805EF9C: @ 0x0805EF9C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	ldr r0, _0805EFFC @ =gUnknown_03003F20
	ldr r6, [r0]
	add r0, sp, #4
	bl sub_08058F30
	ldr r0, _0805F000 @ =gUnknown_0816DAA0
	mov r8, r0
	ldr r5, [r0]
	ldr r0, _0805F004 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	add r3, sp, #4
	ldrb r3, [r3]
	movs r4, #0
	str r4, [sp]
	ldr r4, [r5]
	bl _call_via_r4
	bl sub_08059AEC
	adds r0, r6, #0
	bl sub_08059C60
	ldr r1, _0805F008 @ =0xFFFF0000
	ldr r0, [sp, #8]
	ands r0, r1
	ldr r5, _0805F00C @ =0x0000270F
	orrs r0, r5
	str r0, [sp, #8]
	add r4, sp, #8
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08059C00
	ldrh r0, [r4]
	mov r6, r8
	cmp r0, r5
	bne _0805F010
	bl sub_0805F4F8
	b _0805F02E
	.align 2, 0
_0805EFFC: .4byte gUnknown_03003F20
_0805F000: .4byte gUnknown_0816DAA0
_0805F004: .4byte gUnknown_030040D8
_0805F008: .4byte 0xFFFF0000
_0805F00C: .4byte 0x0000270F
_0805F010:
	ldr r1, _0805F068 @ =gUnknown_03003340
	ldrh r0, [r4, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x79
	bgt _0805F02E
	adds r0, r4, #0
	bl sub_080591E4
_0805F02E:
	ldr r0, _0805F06C @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _0805F070 @ =0x00002D5A
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r3, [r6]
	ldrh r0, [r4]
	add r5, sp, #8
	ldrh r1, [r5, #2]
	movs r2, #0
	str r2, [sp]
	ldr r4, [r3]
	movs r2, #0x10
	movs r3, #0x78
	bl _call_via_r4
	adds r0, r5, #0
	bl sub_08059464
	bl sub_0805F7B8
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F068: .4byte gUnknown_03003340
_0805F06C: .4byte gUnknown_08499590
_0805F070: .4byte 0x00002D5A

