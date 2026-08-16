	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080094
sub_08080094: @ 0x08080094
	push {r4, lr}
	ldr r4, _080800AC @ =gUnknown_030033EC
	ldrh r0, [r4]
	bl sub_0801A5B0
	ldrh r0, [r4]
	bl sub_08043834
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080800AC: .4byte gUnknown_030033EC

