	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C9C0
sub_0806C9C0: @ 0x0806C9C0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803B18C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0806CA1C
	ldr r0, [r4, #0x2c]
	subs r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #0
	bge _0806C9EE
	ldr r0, _0806CA24 @ =gUnknown_08581E10
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x34]
	bl sub_0803B5E8
	adds r0, r4, #0
	bl Proc_Break
_0806C9EE:
	ldr r0, _0806CA28 @ =gUnknown_0202F2C4
	ldr r1, [r0]
	ldr r0, _0806CA2C @ =0x00000A8C
	subs r0, r0, r1
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bhi _0806CA1C
	ldr r0, _0806CA30 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0806CA1C
	movs r0, #0x71
	bl sub_0803B4DC
	bl sub_08030ED4
	ldr r1, _0806CA34 @ =gUnknown_08581C90
	adds r0, r4, #0
	bl Proc_GotoScript
_0806CA1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CA24: .4byte gUnknown_08581E10
_0806CA28: .4byte gUnknown_0202F2C4
_0806CA2C: .4byte 0x00000A8C
_0806CA30: .4byte gUnknown_03002EE0
_0806CA34: .4byte gUnknown_08581C90

