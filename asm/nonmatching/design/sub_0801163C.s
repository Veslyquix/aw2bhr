	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801163C
sub_0801163C: @ 0x0801163C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011660 @ =gUnknown_0848925C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	ldr r2, _08011664 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011660: .4byte gUnknown_0848925C
_08011664: .4byte gUnknown_030030E0

