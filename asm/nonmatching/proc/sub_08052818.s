	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052818
sub_08052818: @ 0x08052818
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r3, _08052870 @ =gUnknown_085D6A48
	ldr r2, _08052874 @ =gUnknown_08136110
	ldr r0, [r2]
	lsls r4, r5, #4
	adds r0, #2
	adds r0, r4, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldrh r0, [r3, #4]
	mov sb, r2
	cmp r0, #0
	bne _080528C4
	ldr r2, _08052878 @ =gUnknown_02029A10
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r4, r0, r2
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0805285E
	b _08052964
_0805285E:
	ldrh r0, [r3]
	cmp r0, #1
	bhi _0805287C
	movs r1, #0
	movs r0, #1
	strh r0, [r4, #0x1c]
	strb r1, [r4]
	b _08052964
	.align 2, 0
_08052870: .4byte gUnknown_085D6A48
_08052874: .4byte gUnknown_08136110
_08052878: .4byte gUnknown_02029A10
_0805287C:
	ldr r0, _080528B8 @ =gUnknown_0300454C
	movs r1, #0
	strh r5, [r0]
	strh r6, [r0, #2]
	strb r1, [r4]
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08052964
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08052964
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	ldr r1, _080528BC @ =gUnknown_02029BA8
	lsls r2, r5, #5
	adds r1, #0x14
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
	ldr r0, _080528C0 @ =0x0000FFFF
	strh r0, [r4, #0x18]
	b _08052964
	.align 2, 0
_080528B8: .4byte gUnknown_0300454C
_080528BC: .4byte gUnknown_02029BA8
_080528C0: .4byte 0x0000FFFF
_080528C4:
	ldr r1, _08052970 @ =gUnknown_02029808
	movs r0, #0x6c
	adds r2, r5, #0
	muls r2, r0, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08052974 @ =gUnknown_08136114
	mov ip, r1
	lsls r1, r6, #3
	mov r8, r1
	cmp r0, #0xff
	bne _08052920
	movs r3, #0
	adds r2, r4, #0
	mov r0, ip
	ldr r7, [r0]
	movs r0, #0xb4
	adds r4, r5, #0
	muls r4, r0, r4
_080528F6:
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r7
	ldrb r1, [r0, #1]
	strb r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _080528F6
	mov r1, sb
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0xa
	adds r1, r2, r1
	adds r0, #0xc
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
_08052920:
	mov r0, ip
	ldr r2, [r0]
	mov r1, r8
	adds r0, r1, r6
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r4, r0, r2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08052964
	strb r0, [r4]
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08052964
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08052964
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	ldr r1, _08052978 @ =gUnknown_02029BA8
	lsls r2, r5, #5
	adds r1, #0x14
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
_08052964:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052970: .4byte gUnknown_02029808
_08052974: .4byte gUnknown_08136114
_08052978: .4byte gUnknown_02029BA8

