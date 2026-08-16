	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800517C
sub_0800517C: @ 0x0800517C
	ldr r0, _08005188 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	adds r0, #0x9c
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08005188: .4byte gUnknown_0200B0B0

