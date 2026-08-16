	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037F94
sub_08037F94: @ 0x08037F94
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0801237C
	bl sub_08012358
	ldr r0, _08037FB0 @ =gUnknown_08615CB0
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037FB0: .4byte gUnknown_08615CB0

