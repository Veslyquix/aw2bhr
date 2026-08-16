	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080265B0
sub_080265B0: @ 0x080265B0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _080265C4
	movs r1, #5
	bl sub_08026584
	b _080265CA
_080265C4:
	movs r1, #0xa
	bl sub_08026584
_080265CA:
	pop {r0}
	bx r0
	.align 2, 0

