	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080139C4
sub_080139C4: @ 0x080139C4
	push {r4, r5, lr}
	movs r4, #0x1f
	lsls r5, r0, #0x18
_080139CA:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	asrs r1, r5, #0x18
	bl sub_0801394C
	subs r4, #1
	cmp r4, #0
	bge _080139CA
	pop {r4, r5}
	pop {r0}
	bx r0

