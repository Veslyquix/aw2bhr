	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A028
sub_0804A028: @ 0x0804A028
	push {lr}
	ldr r0, _0804A038 @ =gUnknown_084C3824
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0804A038: .4byte gUnknown_084C3824

