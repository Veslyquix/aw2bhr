	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080115F8
sub_080115F8: @ 0x080115F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801160C @ =gUnknown_0848925C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801160C: .4byte gUnknown_0848925C

