	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080604F4
sub_080604F4: @ 0x080604F4
	ldr r1, _08060504 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08060508 @ =gUnknown_030045D4
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08060504: .4byte gUnknown_03004780
_08060508: .4byte gUnknown_030045D4

