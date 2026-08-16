	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045478
sub_08045478: @ 0x08045478
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	ldr r0, _0804548C @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_08044AB8
	pop {r0}
	bx r0
	.align 2, 0
_0804548C: .4byte gUnknown_030033EC

