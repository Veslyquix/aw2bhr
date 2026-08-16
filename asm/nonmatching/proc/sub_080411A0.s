	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080411A0
sub_080411A0: @ 0x080411A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080411C8 @ =gUnknown_0849FD44
	bl Proc_Find
	ldr r0, [r0, #0x34]
	movs r1, #1
	bl sub_0801C4D4
	ldr r0, _080411CC @ =gUnknown_0849FE0C
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0x6d
	bl sub_0803B4DC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080411C8: .4byte gUnknown_0849FD44
_080411CC: .4byte gUnknown_0849FE0C

