	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074410
sub_08074410: @ 0x08074410
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_08074584
	cmp r0, #0
	beq _08074432
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _08074432
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08074484
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08074434
_08074432:
	movs r0, #0
_08074434:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

