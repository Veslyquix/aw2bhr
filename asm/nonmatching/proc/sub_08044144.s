	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044144
sub_08044144: @ 0x08044144
	ldr r1, _08044158 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1f]
	strb r0, [r1, #0x1e]
	bx lr
	.align 2, 0
_08044158: .4byte gUnknown_08499598

