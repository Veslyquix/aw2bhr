	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041334
sub_08041334: @ 0x08041334
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6f
	bl sub_0803B4DC
	adds r4, #0x4c
	movs r0, #0x12
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

