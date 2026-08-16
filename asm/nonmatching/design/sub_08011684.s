	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011684
sub_08011684: @ 0x08011684
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801169C @ =gUnknown_084892C4
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801169C: .4byte gUnknown_084892C4

