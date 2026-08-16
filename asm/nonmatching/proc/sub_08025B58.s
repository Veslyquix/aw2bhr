	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025B58
sub_08025B58: @ 0x08025B58
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08025B78 @ =gUnknown_08499598
	ldr r3, [r2]
	lsls r2, r0, #4
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _08025B7C @ =0x000F423F
	cmp r0, r1
	bls _08025B76
	str r1, [r2]
_08025B76:
	bx lr
	.align 2, 0
_08025B78: .4byte gUnknown_08499598
_08025B7C: .4byte 0x000F423F

