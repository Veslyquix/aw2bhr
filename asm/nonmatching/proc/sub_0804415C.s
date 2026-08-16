	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804415C
sub_0804415C: @ 0x0804415C
	ldr r1, _08044174 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #0x1e]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_08044174: .4byte gUnknown_08499598

