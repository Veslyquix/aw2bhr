	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039674
sub_08039674: @ 0x08039674
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	adds r0, #0x64
	movs r6, #0
	strh r6, [r0]
	ldr r0, _080396E0 @ =gUnknown_0849D6D4
	adds r1, r4, #0
	bl Proc_Start
	ldr r1, _080396E4 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r5, #4
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x1d]
	str r2, [r0, #0x54]
	ldrb r0, [r1, #0x1d]
	adds r1, r4, #0
	bl sub_08039930
	bl sub_08024584
	ldr r2, _080396E8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080396EC @ =gUnknown_03002020
	strh r6, [r0]
	ldr r1, _080396F0 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0xd0
	bl sub_0803B524
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080396E0: .4byte gUnknown_0849D6D4
_080396E4: .4byte gUnknown_08499598
_080396E8: .4byte gUnknown_030030E0
_080396EC: .4byte gUnknown_03002020
_080396F0: .4byte gUnknown_03002B28

