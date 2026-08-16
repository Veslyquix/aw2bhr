	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B09C
sub_0806B09C: @ 0x0806B09C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080137AC
	movs r0, #0x80
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

