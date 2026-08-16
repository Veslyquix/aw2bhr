	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080725E4
sub_080725E4: @ 0x080725E4
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl sub_080725A8
	movs r1, #0
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

