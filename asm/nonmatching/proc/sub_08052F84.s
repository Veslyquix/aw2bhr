	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052F84
sub_08052F84: @ 0x08052F84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	bl sub_08057464
	ldr r2, _0805302C @ =gUnknown_08136118
	ldr r4, [r2]
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _08052FAA
	bl sub_08052F3C
_08052FAA:
	ldr r0, [r4]
	ldrh r1, [r0, #2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08052FBA
	bl sub_08054BA0
_08052FBA:
	ldr r6, [r4]
	ldrh r1, [r6, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r6, #0
	cmp r0, #0
	beq _08052FD4
	ldr r0, _08053030 @ =gUnknown_030045AC
	ldrh r1, [r0]
	movs r2, #1
	eors r1, r2
	strh r1, [r0]
_08052FD4:
	ldrh r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	beq _08052FF0
	ldr r4, _08053034 @ =gUnknown_03004540
	ldrh r0, [r4]
	adds r0, #1
	movs r1, #3
	bl __modsi3
	strh r0, [r4]
_08052FF0:
	ldrh r1, [r6, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805306C
	ldr r5, _08053038 @ =gUnknown_0813611C
	ldr r3, [r5]
	ldr r4, _0805303C @ =gUnknown_08136120
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r1, r1, #1
	ldr r2, _08053040 @ =gUnknown_08136124
	ldr r0, [r2]
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r7, r1, r3
	movs r1, #0
	ldrsh r3, [r7, r1]
	ldrh r1, [r6]
	mov r0, r8
	ands r0, r1
	adds r1, r5, #0
	adds r5, r2, #0
	cmp r0, #0
	beq _08053044
	adds r0, r3, #0
	adds r0, #0xa
	b _08053046
	.align 2, 0
_0805302C: .4byte gUnknown_08136118
_08053030: .4byte gUnknown_030045AC
_08053034: .4byte gUnknown_03004540
_08053038: .4byte gUnknown_0813611C
_0805303C: .4byte gUnknown_08136120
_08053040: .4byte gUnknown_08136124
_08053044:
	adds r0, r3, #1
_08053046:
	strh r0, [r7]
	ldr r2, [r1]
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r1, r1, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r5, r1, r2
	movs r3, #0
	ldrsh r2, [r5, r3]
	ldr r0, _080530B0 @ =gUnknown_08551A28
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r2, r1
	ble _0805306C
	movs r0, #0
	strh r0, [r5]
_0805306C:
	mov r1, sl
	ldr r0, [r1]
	ldr r7, [r0]
	ldrh r1, [r7, #2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080530E6
	ldr r5, _080530B4 @ =gUnknown_0813611C
	ldr r3, [r5]
	ldr r4, _080530B8 @ =gUnknown_08136120
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r1, r1, #1
	ldr r2, _080530BC @ =gUnknown_08136124
	ldr r0, [r2]
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r6, r1, r3
	movs r0, #0
	ldrsh r3, [r6, r0]
	ldrh r1, [r7]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	adds r1, r5, #0
	adds r5, r2, #0
	cmp r0, #0
	beq _080530C0
	adds r0, r3, #0
	subs r0, #0xa
	b _080530C2
	.align 2, 0
_080530B0: .4byte gUnknown_08551A28
_080530B4: .4byte gUnknown_0813611C
_080530B8: .4byte gUnknown_08136120
_080530BC: .4byte gUnknown_08136124
_080530C0:
	subs r0, r3, #1
_080530C2:
	strh r0, [r6]
	ldr r2, [r1]
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r1, r1, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r2, r1, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _080530E6
	ldr r0, _08053140 @ =gUnknown_08551A28
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2]
_080530E6:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08053130
	movs r1, #0
	ldr r6, _08053144 @ =gUnknown_03004580
	ldr r5, _08053148 @ =gUnknown_03004550
_080530FC:
	lsls r0, r1, #4
	adds r4, r1, #1
	adds r2, r0, r5
	adds r1, r0, r6
	movs r3, #7
_08053106:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08053106
	adds r1, r4, #0
	cmp r1, #1
	ble _080530FC
	ldr r1, _0805314C @ =gUnknown_0300450C
	ldr r0, _08053150 @ =gUnknown_030045AC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08053154 @ =gUnknown_03004520
	ldr r0, _08053158 @ =gUnknown_03004540
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sb
	bl Proc_End
_08053130:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053140: .4byte gUnknown_08551A28
_08053144: .4byte gUnknown_03004580
_08053148: .4byte gUnknown_03004550
_0805314C: .4byte gUnknown_0300450C
_08053150: .4byte gUnknown_030045AC
_08053154: .4byte gUnknown_03004520
_08053158: .4byte gUnknown_03004540

