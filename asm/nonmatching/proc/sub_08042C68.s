	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042C68
sub_08042C68: @ 0x08042C68
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08043050
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08042C94
	ldr r1, _08042C90 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	muls r0, r4, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x18]
	cmp r0, #3
	bgt _08042C94
	cmp r0, #2
	blt _08042C94
	movs r0, #2
	rsbs r0, r0, #0
	b _08042C96
	.align 2, 0
_08042C90: .4byte gUnknown_085D5ABC
_08042C94:
	movs r0, #0
_08042C96:
	pop {r4}
	pop {r1}
	bx r1

