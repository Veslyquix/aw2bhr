	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040624
sub_08040624: @ 0x08040624
	push {r4, lr}
	sub sp, #8
	movs r4, #0xe5
	lsls r4, r4, #1
	str r2, [sp]
	str r3, [sp, #4]
	adds r2, r4, #0
	movs r3, #5
	bl sub_08040554
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

