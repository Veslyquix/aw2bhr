	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DA54
sub_0801DA54: @ 0x0801DA54
	ldr r2, _0801DA64 @ =gUnknown_0200E438
	movs r1, #0x4c
	muls r1, r0, r1
	adds r1, r1, r2
	ldr r0, [r1, #0x2c]
	movs r2, #0
	str r2, [r1, #0x2c]
	bx lr
	.align 2, 0
_0801DA64: .4byte gUnknown_0200E438

