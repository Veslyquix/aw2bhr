	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035000
sub_08035000: @ 0x08035000
	ldr r2, _0803500C @ =gUnknown_085C77A0
	movs r1, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	bx lr
	.align 2, 0
_0803500C: .4byte gUnknown_085C77A0

