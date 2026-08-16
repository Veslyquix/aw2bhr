	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A68C
sub_0804A68C: @ 0x0804A68C
	ldr r0, _0804A6A0 @ =gUnknown_030044E0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x5d
	adds r0, #0x2c
	ldrb r1, [r1]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804A6A0: .4byte gUnknown_030044E0

