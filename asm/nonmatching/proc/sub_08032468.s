	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032468
sub_08032468: @ 0x08032468
	push {lr}
	ldr r0, _0803247C @ =gUnknown_0849B62C
	bl Proc_EndEach
	ldr r0, _08032480 @ =gUnknown_0849B060
	ldr r1, [r0]
	movs r0, #3
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_0803247C: .4byte gUnknown_0849B62C
_08032480: .4byte gUnknown_0849B060

