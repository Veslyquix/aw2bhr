	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044080
sub_08044080: @ 0x08044080
	ldr r2, _08044090 @ =gUnknown_08499598
	ldr r3, [r2]
	lsls r2, r0, #4
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	str r1, [r2, #0x20]
	bx lr
	.align 2, 0
_08044090: .4byte gUnknown_08499598

