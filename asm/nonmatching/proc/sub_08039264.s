	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039264
sub_08039264: @ 0x08039264
	push {lr}
	bl sub_08038D7C
	ldr r0, _08039278 @ =sub_08039188
	movs r1, #2
	bl sub_0801F024
	pop {r0}
	bx r0
	.align 2, 0
_08039278: .4byte sub_08039188

