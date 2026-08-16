	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080320AC
sub_080320AC: @ 0x080320AC
	push {r4, lr}
	ldr r4, _080320C8 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0xb
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080320C8: .4byte gUnknown_0849B060

