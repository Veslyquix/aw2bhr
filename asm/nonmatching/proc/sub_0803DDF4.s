	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803DDF4
sub_0803DDF4: @ 0x0803DDF4
	push {lr}
	ldr r0, _0803DE04 @ =gUnknown_0849F628
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0803DE04: .4byte gUnknown_0849F628

