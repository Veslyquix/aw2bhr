	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D77C
sub_0806D77C: @ 0x0806D77C
	adds r1, r0, #0
	ldr r0, _0806D794 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806D798
	str r0, [r1, #0x34]
	movs r0, #2
	rsbs r0, r0, #0
	b _0806D79E
	.align 2, 0
_0806D794: .4byte gUnknown_08580934
_0806D798:
	movs r0, #0
	str r0, [r1, #0x34]
	movs r0, #2
_0806D79E:
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0

