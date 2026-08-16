	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043B14
sub_08043B14: @ 0x08043B14
	push {lr}
	adds r3, r1, #0
	ldr r2, _08043B38 @ =gUnknown_084A0090
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _08043B3C @ =0x000003FF
	ands r1, r3
	lsls r1, r1, #5
	ldr r2, _08043B40 @ =0x06010000
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08043B38: .4byte gUnknown_084A0090
_08043B3C: .4byte 0x000003FF
_08043B40: .4byte 0x06010000

