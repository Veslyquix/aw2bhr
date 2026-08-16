	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022974
sub_08022974: @ 0x08022974
	push {lr}
	movs r0, #0
	movs r1, #0xa
	bl sub_0801F178
	ldr r0, _0802298C @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0801A548
	pop {r0}
	bx r0
	.align 2, 0
_0802298C: .4byte gUnknown_030033EC

