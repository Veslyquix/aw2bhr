	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DA18
sub_0802DA18: @ 0x0802DA18
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #1
	bl sub_0802776C
	bl sub_08019850
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802DA32
	b _0802DBBA
_0802DA32:
	ldr r2, _0802DA70 @ =gUnknown_03001470
	ldr r3, _0802DA74 @ =gUnknown_08090C18
	ldr r0, [r3]
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r5, r0, r2
	ldr r2, _0802DA78 @ =gUnknown_08090C1C
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	mov sb, r3
	mov r8, r2
	cmp r0, #0
	beq _0802DADA
	ldr r6, _0802DA7C @ =gUnknown_02023830
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0802DA80
	movs r0, #0x68
	bl sub_0803B4DC
	b _0802DBBA
	.align 2, 0
_0802DA70: .4byte gUnknown_03001470
_0802DA74: .4byte gUnknown_08090C18
_0802DA78: .4byte gUnknown_08090C1C
_0802DA7C: .4byte gUnknown_02023830
_0802DA80:
	movs r0, #0x65
	bl sub_0803B4DC
	bl sub_08025AEC
	cmp r0, #0
	bne _0802DA94
	bl sub_0802DBE4
	b _0802DBBA
_0802DA94:
	ldr r4, _0802DB10 @ =gUnknown_030040A4
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	movs r3, #0x20
	ldrsh r2, [r5, r3]
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrb r2, [r2]
	bl sub_08025E08
	adds r7, r0, #0
	ldr r1, _0802DB14 @ =gUnknown_03003100
	ldrh r0, [r4]
	strh r0, [r1]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldr r0, _0802DB18 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802DAD2
	movs r4, #0x20
	ldrsh r0, [r5, r4]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802DAD2:
	movs r0, #0xe
	adds r1, r7, #0
	bl sub_08074410
_0802DADA:
	mov r0, r8
	ldr r4, [r0]
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802DAF0
	movs r0, #0x66
	bl sub_0803B4DC
_0802DAF0:
	ldr r2, [r4]
	ldrh r1, [r2, #4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0802DB1C
	mov r1, sb
	ldr r0, [r1]
	ldrb r0, [r0]
	bl sub_08015C30
	bl sub_0802D76C
	bl sub_0803A59C
	b _0802DBBA
	.align 2, 0
_0802DB10: .4byte gUnknown_030040A4
_0802DB14: .4byte gUnknown_03003100
_0802DB18: .4byte gUnknown_03003FC0
_0802DB1C:
	ldrh r1, [r2, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802DB44
	ldrh r2, [r5, #0x20]
	movs r3, #0x20
	ldrsh r1, [r5, r3]
	movs r4, #0x22
	ldrsh r0, [r5, r4]
	cmp r1, r0
	bge _0802DB44
	adds r0, r2, #1
	strh r0, [r5, #0x20]
	adds r0, r5, #0
	bl sub_0802D9B8
	movs r0, #0x67
	bl sub_0803B4DC
_0802DB44:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802DB6E
	ldrh r1, [r5, #0x20]
	movs r2, #0x20
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0802DB6E
	subs r0, r1, #1
	strh r0, [r5, #0x20]
	adds r0, r5, #0
	bl sub_0802D9B8
	movs r0, #0x67
	bl sub_0803B4DC
_0802DB6E:
	ldr r2, _0802DBC8 @ =gUnknown_030033E4
	movs r0, #1
	strh r0, [r2]
	ldrh r1, [r5, #0x20]
	ldrh r0, [r5, #0x1e]
	subs r1, r1, r0
	adds r1, #2
	strh r1, [r2, #2]
	lsls r1, r1, #4
	adds r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x10
	movs r2, #3
	bl sub_0802323C
	movs r3, #0x1e
	ldrsh r0, [r5, r3]
	cmp r0, #0
	beq _0802DBA0
	movs r0, #0x44
	movs r1, #0x2a
	movs r2, #0xe
	bl sub_08043418
_0802DBA0:
	movs r4, #0x1e
	ldrsh r0, [r5, r4]
	adds r0, #7
	ldr r1, _0802DBCC @ =gUnknown_0300055A
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bge _0802DBBA
	movs r0, #0x44
	movs r1, #0x96
	movs r2, #0xf
	bl sub_08043418
_0802DBBA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DBC8: .4byte gUnknown_030033E4
_0802DBCC: .4byte gUnknown_0300055A

