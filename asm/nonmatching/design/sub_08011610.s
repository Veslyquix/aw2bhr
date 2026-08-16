	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011610
sub_08011610: @ 0x08011610
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011634 @ =gUnknown_0848923C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	ldr r2, _08011638 @ =gUnknown_030030E0
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
_08011634: .4byte gUnknown_0848923C
_08011638: .4byte gUnknown_030030E0

