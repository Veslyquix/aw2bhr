	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071F70
sub_08071F70: @ 0x08071F70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08071F84 @ =gUnknown_08613EC4
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071F84: .4byte gUnknown_08613EC4

