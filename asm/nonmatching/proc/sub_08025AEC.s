	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025AEC
sub_08025AEC: @ 0x08025AEC
	ldr r0, _08025B10 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	adds r2, r0, #1
	adds r3, r0, #0
	adds r3, #0x33
	cmp r2, r3
	bge _08025B20
	ldr r0, _08025B14 @ =gUnknown_08499594
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
_08025B06:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08025B18
	adds r0, r1, #0
	b _08025B22
	.align 2, 0
_08025B10: .4byte gUnknown_03003F2C
_08025B14: .4byte gUnknown_08499594
_08025B18:
	adds r1, #0xc
	adds r2, #1
	cmp r2, r3
	blt _08025B06
_08025B20:
	movs r0, #0
_08025B22:
	bx lr

