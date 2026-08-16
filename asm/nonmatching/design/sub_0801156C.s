	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801156C
sub_0801156C: @ 0x0801156C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011584 @ =gUnknown_0848925C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011584: .4byte gUnknown_0848925C

