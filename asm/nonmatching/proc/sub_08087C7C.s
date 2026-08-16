	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087C7C
sub_08087C7C: @ 0x08087C7C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _08087C90
	adds r0, r1, #0
	bl sub_0803D960
_08087C90:
	pop {r0}
	bx r0

