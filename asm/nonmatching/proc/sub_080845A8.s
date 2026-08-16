	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080845A8
sub_080845A8: @ 0x080845A8
	push {lr}
	ldr r1, _080845BC @ =gUnknown_08616AC0
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080845C0 @ =0x06013300
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080845BC: .4byte gUnknown_08616AC0
_080845C0: .4byte 0x06013300

