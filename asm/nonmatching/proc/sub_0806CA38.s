	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CA38
sub_0806CA38: @ 0x0806CA38
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080137AC
	movs r0, #0x20
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

