	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080321A8
sub_080321A8: @ 0x080321A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080321CC @ =gUnknown_0849B868
	bl Proc_Find
	cmp r0, #0
	bne _080321C6
	ldr r0, _080321D0 @ =gUnknown_0849B7D8
	bl Proc_Find
	cmp r0, #0
	bne _080321C6
	adds r0, r4, #0
	bl Proc_Break
_080321C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080321CC: .4byte gUnknown_0849B868
_080321D0: .4byte gUnknown_0849B7D8

