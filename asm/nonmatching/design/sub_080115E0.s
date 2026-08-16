	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080115E0
sub_080115E0: @ 0x080115E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080115F4 @ =gUnknown_0848923C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080115F4: .4byte gUnknown_0848923C

