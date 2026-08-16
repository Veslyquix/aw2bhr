	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031FB8
sub_08031FB8: @ 0x08031FB8
	push {r4, lr}
	ldr r4, _08031FD4 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #5
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031FD4: .4byte gUnknown_0849B060

