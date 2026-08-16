	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BB90
sub_0803BB90: @ 0x0803BB90
	ldr r0, _0803BB9C @ =gUnknown_0200C420
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0803BBA0
	movs r0, #0
	b _0803BBA2
	.align 2, 0
_0803BB9C: .4byte gUnknown_0200C420
_0803BBA0:
	movs r0, #1
_0803BBA2:
	bx lr

