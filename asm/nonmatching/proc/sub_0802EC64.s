	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802EC64
sub_0802EC64: @ 0x0802EC64
	ldr r2, _0802EC80 @ =gUnknown_03000578
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	ldr r1, _0802EC84 @ =gUnknown_08090C44
	ldr r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0802EC7C
	str r0, [r2]
_0802EC7C:
	bx lr
	.align 2, 0
_0802EC80: .4byte gUnknown_03000578
_0802EC84: .4byte gUnknown_08090C44

