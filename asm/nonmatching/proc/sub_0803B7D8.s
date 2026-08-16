	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B7D8
sub_0803B7D8: @ 0x0803B7D8
	push {lr}
	ldr r2, _0803B7F4 @ =gUnknown_030005C8
	ldr r1, _0803B7F8 @ =gUnknown_030005CA
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r2, _0803B7FC @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0803B800 @ =gUnknown_03005AE0
	movs r1, #2
	bl sub_08070620
	pop {r0}
	bx r0
	.align 2, 0
_0803B7F4: .4byte gUnknown_030005C8
_0803B7F8: .4byte gUnknown_030005CA
_0803B7FC: .4byte 0x0000FFFF
_0803B800: .4byte gUnknown_03005AE0

