	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060554
sub_08060554: @ 0x08060554
	ldr r1, _08060564 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08060568 @ =gUnknown_030045D4
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08060564: .4byte gUnknown_03004780
_08060568: .4byte gUnknown_030045D4

