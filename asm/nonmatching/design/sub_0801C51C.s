	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C51C
sub_0801C51C: @ 0x0801C51C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C536
	ldr r0, [r4]
	cmp r0, #0
	beq _0801C536
	adds r0, r4, #0
	bl sub_0801C640
	adds r0, r4, #0
	bl sub_0801C67C
_0801C536:
	pop {r4}
	pop {r0}
	bx r0

