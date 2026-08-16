	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080130DC
sub_080130DC: @ 0x080130DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	beq _080130F8
	ldr r0, _080130F4 @ =gUnknown_0848936C
	bl Proc_StartBlocking
	b _08013100
	.align 2, 0
_080130F4: .4byte gUnknown_0848936C
_080130F8:
	ldr r0, _08013118 @ =gUnknown_0848936C
	movs r1, #3
	bl Proc_Start
_08013100:
	adds r1, r0, #0
	adds r0, r1, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013118: .4byte gUnknown_0848936C

