	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C658
sub_0803C658: @ 0x0803C658
	push {lr}
	bl sub_0803CAF0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C668
	movs r0, #1
	b _0803C66C
_0803C668:
	movs r0, #1
	rsbs r0, r0, #0
_0803C66C:
	pop {r1}
	bx r1

