	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080039D0
sub_080039D0: @ 0x080039D0
	push {lr}
	ldr r0, _080039E0 @ =gUnknown_08485D9C
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_080039E0: .4byte gUnknown_08485D9C

