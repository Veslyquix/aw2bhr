	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034130
sub_08034130: @ 0x08034130
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x2c]
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r4, [r0]
	ldr r0, _08034160 @ =gUnknown_03002EE0
	ldr r3, [r0]
	ldrh r2, [r3, #4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08034164
	bl sub_0803BD60
	movs r0, #0x66
	bl sub_0803B4DC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _08034202
	.align 2, 0
_08034160: .4byte gUnknown_03002EE0
_08034164:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne _08034202
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _080341A0
	ldr r0, _08034198 @ =gUnknown_0849B060
	ldr r0, [r0]
	strb r4, [r0, #0xd]
	ldr r0, _0803419C @ =gUnknown_0849BB50
	bl Proc_EndEach
	movs r0, #0x71
	bl sub_0803B4DC
	adds r0, r6, #0
	bl Proc_Break
	adds r0, r5, #0
	bl Proc_Break
	b _08034202
	.align 2, 0
_08034198: .4byte gUnknown_0849B060
_0803419C: .4byte gUnknown_0849BB50
_080341A0:
	ldrh r1, [r3, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080341B6
	cmp r4, #0
	beq _080341B2
	subs r0, r4, #1
	b _080341C4
_080341B2:
	movs r4, #2
	b _080341CC
_080341B6:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080341CC
	cmp r4, #1
	bhi _080341CA
	adds r0, r4, #1
_080341C4:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _080341CC
_080341CA:
	movs r4, #0
_080341CC:
	adds r3, r6, #0
	adds r3, #0x36
	ldrb r0, [r3]
	cmp r4, r0
	beq _08034202
	ldrb r0, [r3]
	adds r2, r6, #0
	adds r2, #0x30
	adds r0, r2, r0
	movs r1, #0
	strb r1, [r0]
	strb r4, [r3]
	ldrb r0, [r3]
	adds r2, r2, r0
	movs r0, #1
	strb r0, [r2]
	strb r0, [r7]
	adds r0, r4, #0
	bl sub_080338C0
	movs r0, #0x64
	bl sub_0803B4DC
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_08034202:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

