	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061DA8
sub_08061DA8: @ 0x08061DA8
	ldr r2, _08061DC8 @ =gUnknown_08499598
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r2, [r2]
	adds r2, r2, r1
	ldrb r0, [r2, #0xc]
	ldrb r1, [r2, #0xd]
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	adds r0, r0, r1
	ldrb r1, [r2, #0xf]
	adds r0, r0, r1
	adds r0, #1
	bx lr
	.align 2, 0
_08061DC8: .4byte gUnknown_08499598

