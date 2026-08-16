	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803504C
sub_0803504C: @ 0x0803504C
	push {lr}
	ldr r1, _08035060 @ =gUnknown_03003FC0
	ldrh r0, [r0, #0x20]
	adds r1, #0x2c
	strb r0, [r1]
	ldrb r0, [r1]
	bl sub_08035020
	pop {r0}
	bx r0
	.align 2, 0
_08035060: .4byte gUnknown_03003FC0

