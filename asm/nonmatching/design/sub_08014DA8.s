	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014DA8
sub_08014DA8: @ 0x08014DA8
	push {r4, lr}
	ldr r4, _08014DC0 @ =gUnknown_03000050
	bl sub_08014D7C
	adds r1, r0, #0
	str r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08014DC4
	movs r0, #0
	b _08014DC6
	.align 2, 0
_08014DC0: .4byte gUnknown_03000050
_08014DC4:
	adds r0, r1, #0
_08014DC6:
	pop {r4}
	pop {r1}
	bx r1

