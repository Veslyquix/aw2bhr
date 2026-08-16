	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025D08
sub_08025D08: @ 0x08025D08
	ldr r1, _08025D1C @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3b
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08025D1C: .4byte gUnknown_08499598

