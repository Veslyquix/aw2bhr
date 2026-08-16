	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065700
sub_08065700: @ 0x08065700
	push {lr}
	ldr r0, _0806570C @ =gUnknown_08580C7C
	bl sub_0806377C
	pop {r0}
	bx r0
	.align 2, 0
_0806570C: .4byte gUnknown_08580C7C

