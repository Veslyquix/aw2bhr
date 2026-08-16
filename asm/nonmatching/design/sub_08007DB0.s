	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007DB0
sub_08007DB0: @ 0x08007DB0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08007DCA
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_08007DCA:
	pop {r4, r5}
	pop {r0}
	bx r0

