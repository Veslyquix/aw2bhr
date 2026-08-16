	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066B40
sub_08066B40: @ 0x08066B40
	push {lr}
	ldr r0, _08066B58 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08066B5C
	cmp r0, #1
	beq _08066B62
	b _08066B66
	.align 2, 0
_08066B58: .4byte gUnknown_08580934
_08066B5C:
	bl sub_08066A20
	b _08066B66
_08066B62:
	bl sub_08066874
_08066B66:
	pop {r0}
	bx r0
	.align 2, 0

