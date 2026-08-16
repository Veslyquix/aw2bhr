	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080413A4
sub_080413A4: @ 0x080413A4
	ldr r1, _080413B0 @ =gUnknown_03003338
	lsls r0, r0, #3
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080413B0: .4byte gUnknown_03003338

