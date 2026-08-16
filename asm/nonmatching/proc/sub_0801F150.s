	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F150
sub_0801F150: @ 0x0801F150
	push {r4, r5, lr}
	ldr r5, _0801F174 @ =gUnknown_0200F920
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r5
	str r1, [r4]
	movs r1, #0
	strb r3, [r4, #4]
	strb r1, [r4, #5]
	strh r2, [r4, #8]
	adds r1, r3, #0
	bl sub_0801F178
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F174: .4byte gUnknown_0200F920

