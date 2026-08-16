	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C144
sub_0802C144: @ 0x0802C144
	push {lr}
	ldr r0, _0802C150 @ =gUnknown_0849A520
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_0802C150: .4byte gUnknown_0849A520

