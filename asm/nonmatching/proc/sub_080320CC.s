	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080320CC
sub_080320CC: @ 0x080320CC
	push {lr}
	ldr r0, _080320EC @ =gUnknown_0202575C
	movs r2, #0
	movs r1, #0xa8
	strb r1, [r0]
	ldr r1, _080320F0 @ =gUnknown_0849B018
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_0802F588
	pop {r0}
	bx r0
	.align 2, 0
_080320EC: .4byte gUnknown_0202575C
_080320F0: .4byte gUnknown_0849B018

