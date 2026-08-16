	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071EF0
sub_08071EF0: @ 0x08071EF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08071F08 @ =gUnknown_08613E64
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071F08: .4byte gUnknown_08613E64

