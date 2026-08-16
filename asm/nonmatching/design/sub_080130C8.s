	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080130C8
sub_080130C8: @ 0x080130C8
	adds r3, r0, #0
	b _080130D4
_080130CC:
	ldrh r0, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	adds r3, #2
_080130D4:
	subs r2, #2
	cmp r2, #0
	bne _080130CC
	bx lr

