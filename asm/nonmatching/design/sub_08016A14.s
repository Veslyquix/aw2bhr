	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016A14
sub_08016A14: @ 0x08016A14
	ldr r2, _08016A28 @ =gUnknown_0200C420
	ldrb r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08016A24
	adds r0, r1, #1
	strb r0, [r2, #8]
_08016A24:
	bx lr
	.align 2, 0
_08016A28: .4byte gUnknown_0200C420

