	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BCB8
sub_0803BCB8: @ 0x0803BCB8
	push {lr}
	ldr r0, _0803BCC8 @ =gUnknown_02028030
	ldr r1, _0803BCCC @ =gUnknown_02028078
	movs r2, #0x48
	bl sub_0808B6E8
	pop {r0}
	bx r0
	.align 2, 0
_0803BCC8: .4byte gUnknown_02028030
_0803BCCC: .4byte gUnknown_02028078

