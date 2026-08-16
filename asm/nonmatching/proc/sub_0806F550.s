	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F550
sub_0806F550: @ 0x0806F550
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806F580 @ =gUnknown_03002EE0
	ldr r2, [r0]
	ldrh r1, [r2, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806F588
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r0, _0806F584 @ =gUnknown_0202F2D8
	adds r1, r4, #0
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b _0806F5E4
	.align 2, 0
_0806F580: .4byte gUnknown_03002EE0
_0806F584: .4byte gUnknown_0202F2D8
_0806F588:
	ldrh r1, [r2, #2]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0806F5BA
	adds r1, r4, #0
	adds r1, #0x38
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0806F5AA
	movs r0, #0x19
	strb r0, [r1]
_0806F5AA:
	movs r0, #0
	bl sub_0806E8E4
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0806F5E4
_0806F5BA:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0806F5E4
	adds r1, r4, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x19
	ble _0806F5D6
	strb r2, [r1]
_0806F5D6:
	movs r0, #1
	bl sub_0806E8E4
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0806F5E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

