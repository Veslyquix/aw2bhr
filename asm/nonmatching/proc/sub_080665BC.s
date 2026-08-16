	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080665BC
sub_080665BC: @ 0x080665BC
	ldr r1, _080665D0 @ =gUnknown_08580934
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r1, #0x74
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080665D0: .4byte gUnknown_08580934

