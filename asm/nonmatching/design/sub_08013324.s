	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013324
sub_08013324: @ 0x08013324
	ldr r0, _08013330 @ =gUnknown_030030D0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08013334 @ =gUnknown_03002B20
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013330: .4byte gUnknown_030030D0
_08013334: .4byte gUnknown_03002B20

