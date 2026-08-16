	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080039BC
sub_080039BC: @ 0x080039BC
	push {lr}
	ldr r0, _080039CC @ =gUnknown_08485DB4
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_080039CC: .4byte gUnknown_08485DB4

