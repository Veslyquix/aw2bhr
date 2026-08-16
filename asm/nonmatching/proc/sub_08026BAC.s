	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026BAC
sub_08026BAC: @ 0x08026BAC
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08026C64 @ =gUnknown_08090A8C
	ldr r2, [r5]
	movs r1, #0
	movs r3, #0
_08026BB8:
	ldr r0, [r2]
	adds r0, r3, r0
	str r1, [r0]
	str r1, [r0, #4]
	strb r1, [r0, #0x11]
	ldr r0, [r2]
	adds r0, r3, r0
	strb r1, [r0, #0x12]
	ldr r0, [r2]
	adds r0, r3, r0
	strb r1, [r0, #0x13]
	ldr r0, [r2]
	adds r0, r3, r0
	strh r1, [r0, #0x14]
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x18]
	strb r1, [r0, #0x1a]
	ldr r0, [r2]
	adds r0, r3, r0
	strb r1, [r0, #0x1b]
	ldr r0, [r2]
	adds r0, r3, r0
	strb r1, [r0, #0x1c]
	ldr r0, [r2]
	adds r0, r3, r0
	strb r1, [r0, #0x1e]
	ldr r0, [r2]
	adds r0, r3, r0
	strb r1, [r0, #0x1f]
	ldr r0, [r2]
	adds r0, r3, r0
	str r1, [r0, #0x20]
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, r3, r0
	adds r0, #0x25
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, r3, r0
	strh r1, [r0, #0x26]
	strh r1, [r0, #0x28]
	adds r0, #0x2a
	strb r4, [r0]
	ldr r0, [r2]
	adds r0, r3, r0
	adds r0, #0x31
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, r3, r0
	adds r0, #0x32
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, r3, r0
	adds r0, #0x3a
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, r3, r0
	adds r0, #0x3b
	strb r1, [r0]
	adds r3, #0x3c
	adds r4, #1
	cmp r4, #4
	ble _08026BB8
	ldr r2, [r5]
	ldr r0, [r2]
	adds r0, #0x67
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xa3
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xdf
	movs r1, #4
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _08026C68 @ =0x0000011B
	adds r1, r0, r2
	movs r0, #8
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026C64: .4byte gUnknown_08090A8C
_08026C68: .4byte 0x0000011B

