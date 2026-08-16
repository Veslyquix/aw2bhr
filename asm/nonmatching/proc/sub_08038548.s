	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038548
sub_08038548: @ 0x08038548
	push {lr}
	ldr r0, _08038560 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	bl sub_08016D04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08038564 @ =sub_0803BA00
	bl sub_0803D73C
	pop {r0}
	bx r0
	.align 2, 0
_08038560: .4byte gUnknown_03003FC0
_08038564: .4byte sub_0803BA00

