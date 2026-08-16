	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061E80
sub_08061E80: @ 0x08061E80
	adds r2, r0, #0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #0x5b
	bls _08061E96
	ldrb r1, [r2, #9]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
_08061E96:
	bx lr

