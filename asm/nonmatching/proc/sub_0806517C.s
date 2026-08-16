	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806517C
sub_0806517C: @ 0x0806517C
	ldr r1, _08065194 @ =gUnknown_08580934
	ldr r2, [r1]
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r1, #1
	movs r3, #0
	strb r1, [r2]
	movs r1, #0xb
	strh r1, [r0, #0x26]
	strh r3, [r0, #0x38]
	bx lr
	.align 2, 0
_08065194: .4byte gUnknown_08580934

