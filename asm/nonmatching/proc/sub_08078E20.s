	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078E20
sub_08078E20: @ 0x08078E20
	push {lr}
	bl sub_08078E14
	cmp r0, #8
	beq _08078E3E
	cmp r0, #0x10
	beq _08078E3E
	cmp r0, #0x18
	beq _08078E3E
	cmp r0, #0x20
	beq _08078E3E
	cmp r0, #0x22
	beq _08078E3E
	cmp r0, #0x2a
	bne _08078E42
_08078E3E:
	movs r0, #1
	b _08078E44
_08078E42:
	movs r0, #0
_08078E44:
	pop {r1}
	bx r1

