	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D990
sub_0803D990: @ 0x0803D990
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, #0
	bne _0803D9A4
	adds r0, r4, #0
	b _0803D9E4
_0803D9A4:
	cmp r0, #0
	beq _0803D9B8
	cmp r4, r5
	bne _0803D9B0
	cmp r1, #0
	blt _0803D9DE
_0803D9B0:
	cmp r4, r3
	bne _0803D9B8
	cmp r1, #0
	bgt _0803D9D0
_0803D9B8:
	cmp r1, #0
	bge _0803D9D4
	rsbs r2, r1, #0
	subs r0, r4, r5
	cmp r0, #0
	blt _0803D9CA
	cmp r0, r2
	blt _0803D9D0
	b _0803D9D4
_0803D9CA:
	subs r0, r5, r4
	cmp r0, r2
	bge _0803D9D4
_0803D9D0:
	adds r0, r5, #0
	b _0803D9E4
_0803D9D4:
	cmp r1, #0
	ble _0803D9E2
	subs r0, r3, r4
	cmp r0, r1
	bge _0803D9E2
_0803D9DE:
	adds r0, r3, #0
	b _0803D9E4
_0803D9E2:
	adds r0, r4, r1
_0803D9E4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

