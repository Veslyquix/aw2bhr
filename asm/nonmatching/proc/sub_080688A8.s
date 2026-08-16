	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080688A8
sub_080688A8: @ 0x080688A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080688C4 @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080688C4: .4byte gUnknown_0202F204

