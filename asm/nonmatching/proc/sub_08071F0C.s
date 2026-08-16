	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071F0C
sub_08071F0C: @ 0x08071F0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08071F24 @ =gUnknown_08613E84
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071F24: .4byte gUnknown_08613E84

