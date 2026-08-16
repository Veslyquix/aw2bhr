	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801339C
sub_0801339C: @ 0x0801339C
	ldr r1, _080133B0 @ =gUnknown_030030D0
	movs r2, #0
	strh r2, [r1]
	ldr r1, _080133B4 @ =gUnknown_03002B20
	strh r2, [r1]
	movs r1, #0
	str r1, [r0, #0x54]
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0
_080133B0: .4byte gUnknown_030030D0
_080133B4: .4byte gUnknown_03002B20

