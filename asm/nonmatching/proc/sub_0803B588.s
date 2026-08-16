	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B588
sub_0803B588: @ 0x0803B588
	push {lr}
	ldr r1, _0803B59C @ =gUnknown_030005CA
	ldr r2, _0803B5A0 @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
	bl sub_080705AC
	pop {r0}
	bx r0
	.align 2, 0
_0803B59C: .4byte gUnknown_030005CA
_0803B5A0: .4byte 0x0000FFFF

