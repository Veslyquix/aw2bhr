	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E17C
sub_0801E17C: @ 0x0801E17C
	ldr r1, _0801E188 @ =gUnknown_030024F0
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0801E188: .4byte gUnknown_030024F0

