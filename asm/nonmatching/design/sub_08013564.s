	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013564
sub_08013564: @ 0x08013564
	movs r2, #0xf
	rsbs r2, r2, #0
	ldrh r3, [r0, #4]
	adds r1, r2, #0
	ands r1, r3
	strh r1, [r0, #4]
	ldrh r3, [r0, #2]
	adds r1, r2, #0
	ands r1, r3
	strh r1, [r0, #2]
	ldrh r1, [r0]
	ands r2, r1
	strh r2, [r0]
	bx lr

