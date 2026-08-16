	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044094
sub_08044094: @ 0x08044094
	ldr r1, _080440A4 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1, #0x20]
	bx lr
	.align 2, 0
_080440A4: .4byte gUnknown_08499598

