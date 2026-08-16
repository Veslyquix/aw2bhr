	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032950
sub_08032950: @ 0x08032950
	push {r4, r5, r6, lr}
	ldr r5, _080329EC @ =gUnknown_08090D30
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r6, [r0, #4]
	ldr r4, _080329F0 @ =gUnknown_08090D34
	ldr r0, [r4]
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _080329E6
	ldr r2, _080329F4 @ =gUnknown_08090D38
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08032992
	movs r3, #3
	ldr r1, _080329F8 @ =gUnknown_0300449C
_0803297E:
	subs r6, #1
	ands r6, r3
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803297E
	ldr r0, [r5]
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x10]
_08032992:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080329B8
	movs r2, #3
	ldr r1, _080329F8 @ =gUnknown_0300449C
_080329A4:
	adds r6, #1
	ands r6, r2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080329A4
	ldr r0, [r5]
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1, #0x10]
_080329B8:
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r6, [r0, #4]
	lsls r1, r1, #0x10
	lsls r0, r6, #0x10
	cmp r1, r0
	beq _080329E6
	ldr r4, [r4]
	adds r0, r4, #0
	bl Proc_EndEach
	ldr r0, _080329FC @ =gUnknown_0849B670
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Start
	movs r0, #0x67
	bl sub_0803B4DC
_080329E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080329EC: .4byte gUnknown_08090D30
_080329F0: .4byte gUnknown_08090D34
_080329F4: .4byte gUnknown_08090D38
_080329F8: .4byte gUnknown_0300449C
_080329FC: .4byte gUnknown_0849B670

