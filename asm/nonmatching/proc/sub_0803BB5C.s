	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BB5C
sub_0803BB5C: @ 0x0803BB5C
	ldr r0, _0803BB6C @ =gUnknown_03003F30
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803BB70
	movs r0, #1
	b _0803BB72
	.align 2, 0
_0803BB6C: .4byte gUnknown_03003F30
_0803BB70:
	movs r0, #2
_0803BB72:
	bx lr

