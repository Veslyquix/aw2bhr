	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025CF0
sub_08025CF0: @ 0x08025CF0
	ldr r1, _08025D04 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3a
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08025D04: .4byte gUnknown_08499598

