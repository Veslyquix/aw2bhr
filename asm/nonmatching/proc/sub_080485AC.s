	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080485AC
sub_080485AC: @ 0x080485AC
	push {lr}
	ldr r0, _080485BC @ =gUnknown_084C21C8
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_080485BC: .4byte gUnknown_084C21C8

