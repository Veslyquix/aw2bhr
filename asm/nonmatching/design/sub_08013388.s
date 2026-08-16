	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013388
sub_08013388: @ 0x08013388
	ldr r0, _08013394 @ =gUnknown_030030D0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08013398 @ =gUnknown_03002B20
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013394: .4byte gUnknown_030030D0
_08013398: .4byte gUnknown_03002B20

