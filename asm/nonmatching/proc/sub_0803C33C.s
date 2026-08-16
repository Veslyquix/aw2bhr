	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C33C
sub_0803C33C: @ 0x0803C33C
	push {lr}
	bl sub_0803CA70
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C34C
	movs r0, #1
	b _0803C350
_0803C34C:
	movs r0, #1
	rsbs r0, r0, #0
_0803C350:
	pop {r1}
	bx r1

