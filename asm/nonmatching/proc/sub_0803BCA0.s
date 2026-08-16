	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BCA0
sub_0803BCA0: @ 0x0803BCA0
	push {lr}
	ldr r0, _0803BCB0 @ =gUnknown_02028078
	ldr r1, _0803BCB4 @ =gUnknown_02028030
	movs r2, #0x48
	bl sub_0808B6E8
	pop {r0}
	bx r0
	.align 2, 0
_0803BCB0: .4byte gUnknown_02028078
_0803BCB4: .4byte gUnknown_02028030

