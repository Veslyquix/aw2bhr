	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080729CC
sub_080729CC: @ 0x080729CC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08034F6C
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _080729E6
	adds r0, r4, #0
	bl Proc_Break
_080729E6:
	pop {r4}
	pop {r0}
	bx r0

