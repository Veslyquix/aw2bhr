	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017EEC
sub_08017EEC: @ 0x08017EEC
	ldr r2, _08017F00 @ =gUnknown_030030A8
	ldr r1, _08017F04 @ =gUnknown_03001420
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r2, _08017F08 @ =gUnknown_03001FF4
	ldrh r0, [r1]
	adds r0, #0x6f
	strh r0, [r2]
	bx lr
	.align 2, 0
_08017F00: .4byte gUnknown_030030A8
_08017F04: .4byte gUnknown_03001420
_08017F08: .4byte gUnknown_03001FF4

