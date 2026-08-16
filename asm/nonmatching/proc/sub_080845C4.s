	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080845C4
sub_080845C4: @ 0x080845C4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080845E0 @ =gUnknown_08616AC0
	lsls r2, r1, #3
	adds r0, #4
	adds r2, r2, r0
	ldr r0, [r2]
	lsls r1, r1, #0xa
	ldr r2, _080845E4 @ =0x06013B00
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080845E0: .4byte gUnknown_08616AC0
_080845E4: .4byte 0x06013B00

