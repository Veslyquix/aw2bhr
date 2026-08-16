	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014ED4
sub_08014ED4: @ 0x08014ED4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014EF0 @ =gUnknown_03000050
	ldr r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _08014EEA
	adds r0, r2, #0
	bl sub_08014E68
_08014EEA:
	pop {r0}
	bx r0
	.align 2, 0
_08014EF0: .4byte gUnknown_03000050

