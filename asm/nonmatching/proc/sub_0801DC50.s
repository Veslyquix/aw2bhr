	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DC50
sub_0801DC50: @ 0x0801DC50
	push {r4, r5, r6, lr}
	ldr r4, _0801DCC8 @ =gUnknown_0200E438
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x4c
	muls r0, r6, r0
	adds r0, r0, r4
	mov ip, r0
	movs r5, #0
	movs r4, #0
	strh r4, [r0, #2]
	strh r4, [r0]
	str r4, [r0, #0x10]
	str r4, [r0, #0xc]
	str r4, [r0, #0x18]
	str r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	str r1, [r0, #0x48]
	lsls r2, r2, #0x10
	asrs r2, r2, #0xe
	adds r2, r2, r1
	ldr r0, [r2, #4]
	mov r2, ip
	str r0, [r2, #4]
	str r0, [r2, #8]
	ldr r0, [r1]
	str r0, [r2, #0x20]
	strb r3, [r2, #0x1e]
	strh r4, [r2, #0x26]
	str r4, [r2, #0x2c]
	strh r4, [r2, #0x24]
	ldr r0, _0801DCCC @ =0x0000FFFF
	strh r0, [r2, #0x38]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r2, #0x3a]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x3e]
	mov r0, ip
	adds r0, #0x40
	strh r4, [r0]
	subs r0, #0x18
	strb r5, [r0]
	str r4, [r2, #0x44]
	movs r0, #0
	movs r1, #0
	str r0, [r2, #0x30]
	str r1, [r2, #0x34]
	ldr r1, _0801DCD0 @ =gUnknown_03003034
	ldr r0, [r1]
	cmp r6, r0
	blt _0801DCC0
	adds r0, r6, #1
	str r0, [r1]
_0801DCC0:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801DCC8: .4byte gUnknown_0200E438
_0801DCCC: .4byte 0x0000FFFF
_0801DCD0: .4byte gUnknown_03003034

