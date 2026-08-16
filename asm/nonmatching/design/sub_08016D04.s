	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016D04
sub_08016D04: @ 0x08016D04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _08016D22
	cmp r0, #2
	bgt _08016D18
	cmp r0, #1
	beq _08016D1E
	b _08016D2A
_08016D18:
	cmp r1, #3
	beq _08016D26
	b _08016D2A
_08016D1E:
	movs r0, #2
	b _08016D2E
_08016D22:
	movs r0, #3
	b _08016D2E
_08016D26:
	movs r0, #4
	b _08016D2E
_08016D2A:
	movs r0, #1
	rsbs r0, r0, #0
_08016D2E:
	bx lr

