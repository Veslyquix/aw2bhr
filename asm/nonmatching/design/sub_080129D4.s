	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080129D4
sub_080129D4: @ 0x080129D4
	ldr r1, _080129DC @ =gUnknown_03001FD4
	str r0, [r1]
	bx lr
	.align 2, 0
_080129DC: .4byte gUnknown_03001FD4

