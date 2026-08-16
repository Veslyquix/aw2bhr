	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035850
sub_08035850: @ 0x08035850
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r1, #0
	ldr r2, _080358A4 @ =gUnknown_03003124
	ldrb r0, [r2]
	cmp r0, #0
	beq _08035870
_08035862:
	adds r1, #1
	cmp r1, #2
	bgt _08035870
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035862
_08035870:
	cmp r1, #3
	beq _0803589C
	ldr r0, _080358A8 @ =gUnknown_0849BDB8
	movs r1, #5
	bl Proc_Start
	adds r2, r0, #0
	lsls r0, r4, #4
	adds r1, r2, #0
	adds r1, #0x42
	strh r0, [r1]
	lsls r1, r5, #4
	adds r0, r2, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x36
	strb r6, [r0]
_0803589C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080358A4: .4byte gUnknown_03003124
_080358A8: .4byte gUnknown_0849BDB8

