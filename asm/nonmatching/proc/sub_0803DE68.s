	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803DE68
sub_0803DE68: @ 0x0803DE68
	push {lr}
	ldr r3, _0803DE88 @ =gUnknown_02028360
	ldrh r2, [r3, #2]
	ldr r1, _0803DE8C @ =0xFFFFFC3F
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3, #2]
	ldr r2, _0803DE90 @ =gUnknown_020283E0
	ldrh r0, [r2, #2]
	ands r1, r0
	strh r1, [r2, #2]
	bl sub_0803DE14
	pop {r0}
	bx r0
	.align 2, 0
_0803DE88: .4byte gUnknown_02028360
_0803DE8C: .4byte 0xFFFFFC3F
_0803DE90: .4byte gUnknown_020283E0

