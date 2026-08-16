	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080485DC
sub_080485DC: @ 0x080485DC
	push {lr}
	ldr r1, _080485F4 @ =gUnknown_084C30F8
	ldr r1, [r1]
	movs r2, #0x85
	lsls r2, r2, #4
	adds r1, r1, r2
	str r0, [r1]
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_080485F4: .4byte gUnknown_084C30F8

