	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043BC8
sub_08043BC8: @ 0x08043BC8
	push {lr}
	adds r3, r1, #0
	ldr r2, _08043BEC @ =gUnknown_084A0090
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r1, _08043BF0 @ =0x000003FF
	ands r1, r3
	lsls r1, r1, #5
	ldr r2, _08043BF4 @ =0x06010000
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08043BEC: .4byte gUnknown_084A0090
_08043BF0: .4byte 0x000003FF
_08043BF4: .4byte 0x06010000

