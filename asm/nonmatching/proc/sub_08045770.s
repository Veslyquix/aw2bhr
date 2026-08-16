	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045770
sub_08045770: @ 0x08045770
	push {lr}
	ldr r0, _08045788 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	bl sub_08016D04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0804578C @ =sub_0803B8A0
	bl sub_0803D73C
	pop {r0}
	bx r0
	.align 2, 0
_08045788: .4byte gUnknown_03003FC0
_0804578C: .4byte sub_0803B8A0

