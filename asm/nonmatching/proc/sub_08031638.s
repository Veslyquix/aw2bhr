	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031638
sub_08031638: @ 0x08031638
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r6, #0
	bl sub_0802F534
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, _08031684 @ =gUnknown_08090D00
	mov r8, r1
	cmp r0, #1
	ble _0803168C
	bl sub_0802F504
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _0803168C
	bl sub_0802F4A0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803168C
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0803168C
	ldr r5, _08031688 @ =gUnknown_08090D04
	ldr r4, [r5]
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #2
	b _08031696
	.align 2, 0
_08031684: .4byte gUnknown_08090D00
_08031688: .4byte gUnknown_08090D04
_0803168C:
	ldr r5, _080316E4 @ =gUnknown_08090D04
	ldr r4, [r5]
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #1
_08031696:
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	mov sb, r5
	movs r2, #0
	ldr r0, _080316E8 @ =gUnknown_0849B018
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x16
_080316AC:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _080316B6
	adds r6, #1
_080316B6:
	adds r2, #1
	cmp r2, #3
	ble _080316AC
	bl sub_0802F408
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080316D6
	mov r0, r8
	ldr r5, [r0]
	ldr r1, [r5]
	ldrb r0, [r1, #0x1a]
	cmp r0, #0x3c
	bhi _080316D6
	cmp r6, #0
	beq _080316EC
_080316D6:
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	movs r0, #7
	strh r0, [r1, #4]
	b _080316FC
	.align 2, 0
_080316E4: .4byte gUnknown_08090D04
_080316E8: .4byte gUnknown_0849B018
_080316EC:
	ldrb r0, [r1, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _08031704
_080316FC:
	adds r0, r7, #0
	bl Proc_Break
	b _08031818
_08031704:
	ldr r4, _0803177C @ =gpKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08031718
	movs r0, #0x68
	bl sub_0803B4DC
_08031718:
	bl sub_0802F4A0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08031790
	ldr r2, [r5]
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _08031790
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08031790
	ldr r1, _08031780 @ =gUnknown_0300410C
	ldr r0, _08031784 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r2, #4]
	movs r1, #0
	movs r0, #6
	strh r0, [r2, #4]
	ldrb r0, [r2, #0x1a]
	strb r1, [r2, #0x1a]
	movs r2, #0
	adds r4, r5, #0
	movs r3, #0
_08031752:
	ldr r0, [r4]
	adds r0, #0x16
	adds r0, r0, r2
	ldrb r1, [r0]
	strb r3, [r0]
	adds r2, #1
	cmp r2, #3
	ble _08031752
	ldr r0, _08031788 @ =gUnknown_03004400
	ldrb r1, [r0]
	movs r1, #0xff
	strb r1, [r0]
	bl sub_080308B4
	movs r0, #0x71
	bl sub_0803B4DC
	ldr r0, _0803178C @ =gUnknown_0849B1A0
	bl Proc_EndEach
	b _080317FE
	.align 2, 0
_0803177C: .4byte gpKeySt
_08031780: .4byte gUnknown_0300410C
_08031784: .4byte gUnknown_030040CC
_08031788: .4byte gUnknown_03004400
_0803178C: .4byte gUnknown_0849B1A0
_08031790:
	ldr r6, _08031808 @ =gUnknown_03004400
	adds r0, r6, #0
	movs r1, #0
	bl sub_080309AC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08031814
	mov r0, r8
	ldr r4, [r0]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08031814
	ldrb r0, [r6]
	cmp r0, #0xff
	bne _08031814
	ldr r1, _0803180C @ =gUnknown_0300410C
	ldr r0, _08031810 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	movs r2, #0
	movs r0, #6
	strh r0, [r1, #4]
	ldrb r0, [r1, #0x1a]
	strb r2, [r1, #0x1a]
	movs r2, #0
	movs r3, #0
_080317DE:
	ldr r0, [r4]
	adds r0, #0x16
	adds r0, r0, r2
	ldrb r1, [r0]
	strb r3, [r0]
	adds r2, #1
	cmp r2, #3
	ble _080317DE
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	movs r0, #2
	strh r0, [r1, #2]
	movs r0, #0x71
	bl sub_0803B4DC
_080317FE:
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _08031818
	.align 2, 0
_08031808: .4byte gUnknown_03004400
_0803180C: .4byte gUnknown_0300410C
_08031810: .4byte gUnknown_030040CC
_08031814:
	bl sub_08030D84
_08031818:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

