	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011A64
sub_08011A64: @ 0x08011A64
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl sub_0801E0F0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080119A0
_08011A82:
	b _08011A82

