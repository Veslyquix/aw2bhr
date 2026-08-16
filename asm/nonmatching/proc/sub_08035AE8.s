	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035AE8
sub_08035AE8: @ 0x08035AE8
	ldr r2, _08035AFC @ =gUnknown_08090EAC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08035AFC: .4byte gUnknown_08090EAC

