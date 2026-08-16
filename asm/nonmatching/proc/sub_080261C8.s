	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080261C8
sub_080261C8: @ 0x080261C8
	ldr r3, _080261E0 @ =gUnknown_0810E6E0
	ldr r1, _080261E4 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1a]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r3
	bx lr
	.align 2, 0
_080261E0: .4byte gUnknown_0810E6E0
_080261E4: .4byte gUnknown_08499598

