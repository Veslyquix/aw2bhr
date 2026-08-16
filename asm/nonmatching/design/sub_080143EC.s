	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080143EC
sub_080143EC: @ 0x080143EC
	ldrh r2, [r0, #0x34]
	ldrh r3, [r0, #0x2c]
	adds r0, r2, #0
	orrs r0, r3
	strh r0, [r1]
	adds r1, #0x40
	adds r2, #1
	orrs r2, r3
	strh r2, [r1]
	bx lr

