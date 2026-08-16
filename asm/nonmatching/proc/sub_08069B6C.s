	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069B6C
sub_08069B6C: @ 0x08069B6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08069B8C @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	str r0, [r4, #0x2c]
	bl sub_08012358
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069B8C: .4byte gUnknown_0202F204

