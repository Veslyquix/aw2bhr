	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DA68
sub_0801DA68: @ 0x0801DA68
	ldr r2, _0801DA74 @ =gUnknown_0200E438
	movs r1, #0x4c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1e]
	bx lr
	.align 2, 0
_0801DA74: .4byte gUnknown_0200E438

