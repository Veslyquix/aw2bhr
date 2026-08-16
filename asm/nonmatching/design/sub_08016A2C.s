	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016A2C
sub_08016A2C: @ 0x08016A2C
	cmp r0, #2
	beq _08016A44
	cmp r0, #2
	bgt _08016A3A
	cmp r0, #1
	beq _08016A40
	b _08016A4C
_08016A3A:
	cmp r0, #4
	beq _08016A48
	b _08016A4C
_08016A40:
	movs r0, #0
	b _08016A50
_08016A44:
	movs r0, #1
	b _08016A50
_08016A48:
	movs r0, #2
	b _08016A50
_08016A4C:
	movs r0, #1
	rsbs r0, r0, #0
_08016A50:
	bx lr
	.align 2, 0

