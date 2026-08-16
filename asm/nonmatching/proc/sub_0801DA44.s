	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DA44
sub_0801DA44: @ 0x0801DA44
	ldr r2, _0801DA50 @ =gUnknown_0200E438
	movs r1, #0x4c
	muls r0, r1, r0
	adds r0, r0, r2
	ldr r0, [r0, #0x2c]
	bx lr
	.align 2, 0
_0801DA50: .4byte gUnknown_0200E438

