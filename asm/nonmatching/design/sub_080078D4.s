	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080078D4
sub_080078D4: @ 0x080078D4
	ldr r1, _080078E0 @ =gUnknown_0200B0B0
	ldr r1, [r1]
	adds r1, #0x2f
	strb r0, [r1]
	bx lr
	.align 2, 0
_080078E0: .4byte gUnknown_0200B0B0

