	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044374
sub_08044374: @ 0x08044374
	ldr r1, _08044388 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x25
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08044388: .4byte gUnknown_08499598

