	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080604A4
sub_080604A4: @ 0x080604A4
	ldr r1, _080604B4 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	ldr r1, _080604B8 @ =gUnknown_030045D4
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080604B4: .4byte gUnknown_03004780
_080604B8: .4byte gUnknown_030045D4

