	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074EB4
sub_08074EB4: @ 0x08074EB4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r5, #0x40
	movs r4, #4
_08074EBC:
	ldm r5!, {r0}
	bl sub_0801C240
	subs r4, #1
	cmp r4, #0
	bge _08074EBC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

