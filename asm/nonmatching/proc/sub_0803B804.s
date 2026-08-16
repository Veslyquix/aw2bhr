	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B804
sub_0803B804: @ 0x0803B804
	push {lr}
	ldr r1, _0803B81C @ =gUnknown_030005CA
	ldr r0, _0803B820 @ =gUnknown_030005C8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _0803B824 @ =gUnknown_03005AE0
	movs r1, #2
	bl sub_08070640
	pop {r0}
	bx r0
	.align 2, 0
_0803B81C: .4byte gUnknown_030005CA
_0803B820: .4byte gUnknown_030005C8
_0803B824: .4byte gUnknown_03005AE0

