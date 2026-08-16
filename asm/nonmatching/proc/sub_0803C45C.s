	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C45C
sub_0803C45C: @ 0x0803C45C
	push {lr}
	bl sub_0803CA9C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C46C
	movs r0, #1
	b _0803C470
_0803C46C:
	movs r0, #1
	rsbs r0, r0, #0
_0803C470:
	pop {r1}
	bx r1

