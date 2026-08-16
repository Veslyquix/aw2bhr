	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D6E8
sub_0801D6E8: @ 0x0801D6E8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r3, [sp, #0x14]
	cmp r3, #0x1f
	ble _0801D70A
	bl sub_0801E13C
	adds r3, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0801D70A
	adds r0, r3, #0
	b _0801D766
_0801D70A:
	ldr r1, _0801D76C @ =gUnknown_0200E438
	movs r0, #0x4c
	muls r0, r4, r0
	adds r2, r0, r1
	movs r1, #0
	strh r1, [r2, #2]
	strh r1, [r2]
	str r5, [r2, #8]
	str r5, [r2, #4]
	str r1, [r2, #0x10]
	str r1, [r2, #0xc]
	str r1, [r2, #0x18]
	str r1, [r2, #0x14]
	strh r1, [r2, #0x1c]
	str r6, [r2, #0x20]
	strb r7, [r2, #0x1e]
	adds r0, r2, #0
	adds r0, #0x28
	strb r3, [r0]
	strh r1, [r2, #0x26]
	str r1, [r2, #0x2c]
	strh r1, [r2, #0x24]
	ldr r0, _0801D770 @ =0x0000FFFF
	strh r0, [r2, #0x38]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r2, #0x3a]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x3e]
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	str r1, [r2, #0x44]
	movs r0, #0
	movs r1, #0
	str r0, [r2, #0x30]
	str r1, [r2, #0x34]
	ldr r1, _0801D774 @ =gUnknown_03003034
	ldr r0, [r1]
	cmp r4, r0
	blt _0801D764
	adds r0, r4, #1
	str r0, [r1]
_0801D764:
	adds r0, r4, #0
_0801D766:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801D76C: .4byte gUnknown_0200E438
_0801D770: .4byte 0x0000FFFF
_0801D774: .4byte gUnknown_03003034

