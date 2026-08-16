	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071F40
sub_08071F40: @ 0x08071F40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08071F54 @ =gUnknown_08613E84
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071F54: .4byte gUnknown_08613E84

