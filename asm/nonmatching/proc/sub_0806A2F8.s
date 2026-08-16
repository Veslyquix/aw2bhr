	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A2F8
sub_0806A2F8: @ 0x0806A2F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0806A318 @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	str r0, [r4, #0x2c]
	bl sub_0801237C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A318: .4byte gUnknown_0202F204

