	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C154
sub_0802C154: @ 0x0802C154
	ldr r1, _0802C168 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802C168: .4byte gUnknown_08499598

