	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BB74
sub_0803BB74: @ 0x0803BB74
	ldr r0, _0803BB84 @ =gUnknown_03003F30
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803BB88
	movs r0, #1
	b _0803BB8A
	.align 2, 0
_0803BB84: .4byte gUnknown_03003F30
_0803BB88:
	movs r0, #2
_0803BB8A:
	bx lr

