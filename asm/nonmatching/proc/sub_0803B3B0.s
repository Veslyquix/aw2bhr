	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B3B0
sub_0803B3B0: @ 0x0803B3B0
	push {lr}
	ldr r1, _0803B3C4 @ =gUnknown_080910FC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08070990
	pop {r0}
	bx r0
	.align 2, 0
_0803B3C4: .4byte gUnknown_080910FC

