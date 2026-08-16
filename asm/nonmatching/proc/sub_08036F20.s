	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036F20
sub_08036F20: @ 0x08036F20
	push {lr}
	ldr r1, _08036F38 @ =gUnknown_02028E40
	ldr r0, _08036F3C @ =gUnknown_0200C420
	ldrb r0, [r0, #8]
	lsrs r0, r0, #6
	strb r0, [r1]
	ldr r0, _08036F40 @ =gUnknown_0849D34C
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08036F38: .4byte gUnknown_02028E40
_08036F3C: .4byte gUnknown_0200C420
_08036F40: .4byte gUnknown_0849D34C

