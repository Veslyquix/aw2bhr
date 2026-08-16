	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080155A0
sub_080155A0: @ 0x080155A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r3, r2, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0xff
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08015578
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

