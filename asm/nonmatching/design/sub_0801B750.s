	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B750
sub_0801B750: @ 0x0801B750
	push {lr}
	bl sub_0801B780
	ldr r0, _0801B764 @ =gUnknown_0808EF64
	movs r1, #0
	bl sub_0801B8A8
	pop {r0}
	bx r0
	.align 2, 0
_0801B764: .4byte gUnknown_0808EF64

