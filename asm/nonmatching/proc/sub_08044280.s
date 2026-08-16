	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044280
sub_08044280: @ 0x08044280
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080442A0
	adds r0, r5, #0
	bl sub_08044094
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08044208
	cmp r4, r0
	bge _080442A4
_080442A0:
	movs r0, #0
	b _080442A6
_080442A4:
	movs r0, #1
_080442A6:
	pop {r4, r5}
	pop {r1}
	bx r1

