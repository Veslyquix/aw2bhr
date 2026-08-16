	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080425B8
sub_080425B8: @ 0x080425B8
	push {lr}
	bl sub_080424BC
	ldr r3, _080425D8 @ =gUnknown_030040D8
	ldr r1, [r3]
	ldr r2, _080425DC @ =gUnknown_03003100
	ldrh r0, [r2]
	strb r0, [r1, #2]
	ldr r1, [r3]
	ldrh r0, [r2, #2]
	strb r0, [r1, #3]
	bl sub_080258CC
	pop {r0}
	bx r0
	.align 2, 0
_080425D8: .4byte gUnknown_030040D8
_080425DC: .4byte gUnknown_03003100

