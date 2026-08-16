	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053520
sub_08053520: @ 0x08053520
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r7, r3, #0
	ldr r1, _080535C4 @ =gUnknown_020296B0
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrb r1, [r5, #0x1b]
	ldr r0, _080535C8 @ =gUnknown_030045A4
	lsls r6, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	adds r0, #1
	cmp r1, r0
	blt _08053580
	ldr r4, _080535CC @ =gUnknown_085D6C88
	ldrb r0, [r5, #0x1a]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, _080535D0 @ =gUnknown_03004580
	lsls r3, r3, #4
	adds r0, r2, #4
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r2, #2
	adds r3, r3, r2
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r4, #0xc
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_0803B48C
	ldrb r0, [r5, #0x1a]
	adds r0, #1
	movs r1, #0
	strb r0, [r5, #0x1a]
	strb r1, [r5, #0x1b]
_08053580:
	ldr r1, _080535D4 @ =gUnknown_020298E0
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r4, r0, r1
	adds r5, r4, #0
	adds r5, #0x8d
	ldrb r1, [r5]
	ldr r0, _080535D8 @ =gUnknown_03004510
	adds r0, r6, r0
	ldrh r0, [r0]
	adds r0, #1
	cmp r1, r0
	blt _080535BE
	ldr r1, _080535DC @ =gUnknown_085643A8
	adds r4, #0x8c
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	lsls r0, r0, #1
	adds r1, #4
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0803B48C
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #0
	strb r0, [r4]
	strb r1, [r5]
_080535BE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080535C4: .4byte gUnknown_020296B0
_080535C8: .4byte gUnknown_030045A4
_080535CC: .4byte gUnknown_085D6C88
_080535D0: .4byte gUnknown_03004580
_080535D4: .4byte gUnknown_020298E0
_080535D8: .4byte gUnknown_03004510
_080535DC: .4byte gUnknown_085643A8

