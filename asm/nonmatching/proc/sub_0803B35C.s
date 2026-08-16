	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B35C
sub_0803B35C: @ 0x0803B35C
	push {lr}
	ldr r2, _0803B370 @ =gUnknown_030005CE
	strh r0, [r2]
	ldr r0, _0803B374 @ =gUnknown_03005AE0
	ldr r1, _0803B378 @ =0x0000FFFF
	ldrh r2, [r2]
	bl sub_08071420
	pop {r0}
	bx r0
	.align 2, 0
_0803B370: .4byte gUnknown_030005CE
_0803B374: .4byte gUnknown_03005AE0
_0803B378: .4byte 0x0000FFFF

