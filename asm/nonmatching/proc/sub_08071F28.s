	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071F28
sub_08071F28: @ 0x08071F28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08071F3C @ =gUnknown_08613E64
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071F3C: .4byte gUnknown_08613E64

