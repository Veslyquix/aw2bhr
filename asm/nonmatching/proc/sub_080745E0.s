	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080745E0
sub_080745E0: @ 0x080745E0
	adds r0, #0x4c
	movs r3, #0x10
	strh r3, [r0]
	ldr r2, _080745F8 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080745FC @ =gUnknown_03001FFC
	strh r3, [r0]
	bx lr
	.align 2, 0
_080745F8: .4byte gUnknown_030030E0
_080745FC: .4byte gUnknown_03001FFC

