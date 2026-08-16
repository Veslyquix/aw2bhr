	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F480
sub_0802F480: @ 0x0802F480
	ldr r1, _0802F498 @ =gUnknown_0849B018
	ldr r1, [r1]
	ldrb r1, [r1, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0802F49C
	movs r0, #0
	b _0802F49E
	.align 2, 0
_0802F498: .4byte gUnknown_0849B018
_0802F49C:
	movs r0, #1
_0802F49E:
	bx lr

