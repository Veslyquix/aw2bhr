	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F29C
sub_0803F29C: @ 0x0803F29C
	adds r3, r0, #0
	cmp r2, #3
	bne _0803F2AA
	movs r0, #0x18
	str r0, [r3]
	movs r0, #0x30
	str r0, [r1]
_0803F2AA:
	cmp r2, #4
	bne _0803F2B6
	movs r0, #8
	str r0, [r3]
	movs r0, #0x10
	str r0, [r1]
_0803F2B6:
	bx lr

