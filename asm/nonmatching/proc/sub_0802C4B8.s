	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C4B8
sub_0802C4B8: @ 0x0802C4B8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080413E8
	ldr r0, _0802C4D0 @ =gUnknown_0849A02C
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C4D0: .4byte gUnknown_0849A02C

