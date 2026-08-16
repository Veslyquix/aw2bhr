	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BB44
sub_0803BB44: @ 0x0803BB44
	ldr r0, _0803BB54 @ =gUnknown_03003F30
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803BB58
	movs r0, #1
	b _0803BB5A
	.align 2, 0
_0803BB54: .4byte gUnknown_03003F30
_0803BB58:
	movs r0, #2
_0803BB5A:
	bx lr

