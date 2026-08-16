	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040290
sub_08040290: @ 0x08040290
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r1, #0
	mov r4, sp
	mov r1, sp
	bl sub_0803DFE0
	mov r0, sp
	ldrh r0, [r0]
	ldrh r1, [r4, #2]
	adds r2, r5, #0
	bl sub_0803FF04
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

