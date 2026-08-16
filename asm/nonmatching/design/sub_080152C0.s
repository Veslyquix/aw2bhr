	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080152C0
sub_080152C0: @ 0x080152C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #0
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _080152E4
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08015224
_080152E4:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

