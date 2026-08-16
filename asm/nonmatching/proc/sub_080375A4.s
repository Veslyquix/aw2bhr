	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080375A4
sub_080375A4: @ 0x080375A4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080375B8 @ =gUnknown_08090EF0
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_08037448
	pop {r0}
	bx r0
	.align 2, 0
_080375B8: .4byte gUnknown_08090EF0

