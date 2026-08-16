	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084920
sub_08084920: @ 0x08084920
	push {lr}
	bl sub_0803C814
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08084930
	movs r0, #1
	b _08084932
_08084930:
	movs r0, #0
_08084932:
	pop {r1}
	bx r1
	.align 2, 0

