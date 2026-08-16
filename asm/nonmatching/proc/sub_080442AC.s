	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080442AC
sub_080442AC: @ 0x080442AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080442D6
	adds r0, r5, #0
	bl sub_080441D4
	cmp r0, #0
	beq _080442D6
	adds r0, r5, #0
	bl sub_08044094
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_080441D4
	cmp r4, r0
	bge _080442DA
_080442D6:
	movs r0, #0
	b _080442DC
_080442DA:
	movs r0, #1
_080442DC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

