	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E2BC
sub_0802E2BC: @ 0x0802E2BC
	push {lr}
	bl sub_080245D4
	ldr r1, _0802E2CC @ =gUnknown_03003334
	movs r0, #8
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802E2CC: .4byte gUnknown_03003334

