	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080338C0
sub_080338C0: @ 0x080338C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080338D8 @ =gUnknown_0849BB50
	bl Proc_Find
	lsls r4, r4, #5
	adds r4, #0x2e
	str r4, [r0, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080338D8: .4byte gUnknown_0849BB50

