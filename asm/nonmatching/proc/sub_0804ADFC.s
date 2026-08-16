	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804ADFC
sub_0804ADFC: @ 0x0804ADFC
	push {lr}
	ldr r0, _0804AE0C @ =gUnknown_084C3D6C
	movs r1, #1
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0804AE0C: .4byte gUnknown_084C3D6C

