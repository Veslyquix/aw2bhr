	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A6A4
sub_0804A6A4: @ 0x0804A6A4
	movs r1, #0
	ldr r2, _0804A6D4 @ =gUnknown_030044E0
	ldr r0, [r2]
	adds r0, #0x5f
	ldrb r0, [r0]
	adds r0, #1
	cmp r1, r0
	bge _0804A6D0
	movs r3, #0
_0804A6B6:
	ldr r0, [r2]
	adds r0, #0x2c
	adds r0, r0, r1
	strb r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r2]
	adds r0, #0x5f
	ldrb r0, [r0]
	adds r0, #1
	cmp r1, r0
	blt _0804A6B6
_0804A6D0:
	bx lr
	.align 2, 0
_0804A6D4: .4byte gUnknown_030044E0

