	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074628
sub_08074628: @ 0x08074628
	adds r0, #0x4c
	movs r3, #0
	strh r3, [r0]
	ldr r2, _08074640 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08074644 @ =gUnknown_03001FFC
	strh r3, [r0]
	bx lr
	.align 2, 0
_08074640: .4byte gUnknown_030030E0
_08074644: .4byte gUnknown_03001FFC

