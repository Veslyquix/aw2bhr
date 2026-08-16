	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080115B4
sub_080115B4: @ 0x080115B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080115D8 @ =gUnknown_0848925C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	ldr r2, _080115DC @ =gUnknown_030030E0
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
_080115D8: .4byte gUnknown_0848925C
_080115DC: .4byte gUnknown_030030E0

