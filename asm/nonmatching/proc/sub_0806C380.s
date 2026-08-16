	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C380
sub_0806C380: @ 0x0806C380
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x5c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0xf0
	movs r2, #0xa4
	bl sub_08074234
	adds r5, r0, #0
	ldr r0, _0806C3F0 @ =gUnknown_0202F2C0
	ldr r0, [r0]
	cmp r0, #0
	beq _0806C3A4
	bl sub_0806C1E4
_0806C3A4:
	ldr r3, _0806C3F4 @ =gUnknown_085816F0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #4
	adds r0, r1, r3
	movs r6, #0xc
	ldrsh r2, [r0, r6]
	adds r2, #0x54
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	adds r3, #8
	adds r1, r1, r3
	ldr r3, [r1]
	ldr r0, _0806C3F8 @ =0x00001090
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa4
	bl sub_0801BEFC
	ldr r1, _0806C3FC @ =0x000001FF
	ands r1, r5
	ldr r3, _0806C400 @ =gUnknown_08581A98
	movs r0, #0xd0
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl sub_0801BEFC
	ldr r0, [r4, #0x5c]
	cmp r0, #0xf
	ble _0806C404
	adds r0, r4, #0
	bl Proc_Break
	b _0806C408
	.align 2, 0
_0806C3F0: .4byte gUnknown_0202F2C0
_0806C3F4: .4byte gUnknown_085816F0
_0806C3F8: .4byte 0x00001090
_0806C3FC: .4byte 0x000001FF
_0806C400: .4byte gUnknown_08581A98
_0806C404:
	adds r0, #1
	str r0, [r4, #0x5c]
_0806C408:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

