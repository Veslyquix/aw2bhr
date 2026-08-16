	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044178
sub_08044178: @ 0x08044178
	push {r4, lr}
	ldr r4, _08044198 @ =gUnknown_08499598
	ldr r3, [r4]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r3, r1, r3
	movs r2, #0
	strb r2, [r3, #0x1e]
	ldr r0, [r4]
	adds r1, r1, r0
	strh r2, [r1, #0x26]
	strh r2, [r1, #0x28]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044198: .4byte gUnknown_08499598

