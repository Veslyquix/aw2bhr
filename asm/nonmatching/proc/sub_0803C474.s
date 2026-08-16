	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C474
sub_0803C474: @ 0x0803C474
	push {lr}
	bl sub_0803CAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C484
	movs r0, #1
	b _0803C488
_0803C484:
	movs r0, #1
	rsbs r0, r0, #0
_0803C488:
	pop {r1}
	bx r1

