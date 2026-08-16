	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080251BC
sub_080251BC: @ 0x080251BC
	push {lr}
	cmp r1, #0
	bne _080251C8
	bl sub_080251D8
	b _080251D4
_080251C8:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08024F20
_080251D4:
	pop {r0}
	bx r0

