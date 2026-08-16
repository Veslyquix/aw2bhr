	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025B28
sub_08025B28: @ 0x08025B28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08025B50 @ =gUnknown_08499598
	ldr r3, [r2]
	lsls r2, r0, #4
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, [r2]
	subs r0, r0, r1
	str r0, [r2]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r1, _08025B54 @ =0x000F423F
	cmp r0, r1
	bls _08025B4C
	str r1, [r2, #4]
_08025B4C:
	bx lr
	.align 2, 0
_08025B50: .4byte gUnknown_08499598
_08025B54: .4byte 0x000F423F

