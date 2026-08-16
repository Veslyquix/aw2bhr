	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035B68
sub_08035B68: @ 0x08035B68
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08035B7C @ =gUnknown_0849CD88
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, #0x14
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08035B7C: .4byte gUnknown_0849CD88

