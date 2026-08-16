	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014BB4
sub_08014BB4: @ 0x08014BB4
	ldr r1, _08014BBC @ =gUnknown_03002514
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014BBC: .4byte gUnknown_03002514

