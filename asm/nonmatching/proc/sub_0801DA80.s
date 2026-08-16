	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DA80
sub_0801DA80: @ 0x0801DA80
	ldr r2, _0801DA90 @ =gUnknown_0200E438
	movs r1, #0x4c
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x28
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0801DA90: .4byte gUnknown_0200E438

