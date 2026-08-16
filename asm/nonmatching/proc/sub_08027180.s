	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027180
sub_08027180: @ 0x08027180
	ldr r1, _08027194 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08027194: .4byte gUnknown_08499598

