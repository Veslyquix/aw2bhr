	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013FF0
sub_08013FF0: @ 0x08013FF0
	adds r1, r0, #0
	movs r2, #0x1e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08013FFC
	str r0, [r1, #8]
_08013FFC:
	ldrh r0, [r1, #0x1e]
	subs r0, #1
	strh r0, [r1, #0x1e]
	bx lr

