	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080E40
sub_08080E40: @ 0x08080E40
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_08071B0C
	movs r0, #8
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_08071B0C
	movs r0, #0x10
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_08071B0C
	movs r0, #0x11
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_08071B0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

