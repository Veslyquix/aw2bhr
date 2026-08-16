	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005F4C
sub_08005F4C: @ 0x08005F4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _08005FA0 @ =gUnknown_0808D7D8
	ldr r4, [r1]
	ldr r5, [r4]
	movs r0, #6
	ldrsb r0, [r5, r0]
	mov sl, r1
	cmp r0, #0
	beq _08005FF8
	ldrh r2, [r5]
	movs r0, #0x40
	movs r3, #0
	movs r1, #0
	orrs r0, r2
	strh r0, [r5]
	strb r3, [r5, #6]
	ldr r2, [r4]
	strh r1, [r2, #2]
	adds r0, r2, #0
	adds r0, #0x54
	strh r1, [r0]
	strh r1, [r2, #0x3a]
	ldrh r1, [r2]
	ldr r0, _08005FA4 @ =0x0000FFDF
	ands r0, r1
	ldr r1, _08005FA8 @ =0x0000FFFC
	ands r0, r1
	strh r0, [r2]
	movs r3, #7
	ldrsb r3, [r2, r3]
	adds r0, r3, #0
	cmp r0, #0
	bne _08005FAC
	adds r0, r2, #0
	adds r0, #0x2e
	b _08005FB0
	.align 2, 0
_08005FA0: .4byte gUnknown_0808D7D8
_08005FA4: .4byte 0x0000FFDF
_08005FA8: .4byte 0x0000FFFC
_08005FAC:
	adds r0, r2, #0
	adds r0, #0x2f
_08005FB0:
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r3, #0
	bl sub_080078E4
	bl sub_08002DEC
	movs r0, #0
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #0xa0
	bl sub_08003A80
	ldr r1, _08006014 @ =gUnknown_030030E0
	ldrb r0, [r1]
	movs r4, #2
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r1, #1]
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r1, _08006018 @ =gUnknown_03001FFC
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0800601C @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _08006020 @ =gUnknown_03002B28
	movs r0, #0
	strh r0, [r1]
_08005FF8:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08006024
	movs r2, #0xa
	mov r8, r2
	movs r4, #9
	str r4, [sp, #4]
	b _0800602C
	.align 2, 0
_08006014: .4byte gUnknown_030030E0
_08006018: .4byte gUnknown_03001FFC
_0800601C: .4byte gUnknown_03002020
_08006020: .4byte gUnknown_03002B28
_08006024:
	movs r0, #8
	mov r8, r0
	movs r1, #7
	str r1, [sp, #4]
_0800602C:
	mov r2, sl
	ldr r6, [r2]
	ldr r2, [r6]
	ldrh r0, [r2, #2]
	cmp r0, #4
	beq _080060E0
	cmp r0, #4
	bgt _08006046
	cmp r0, #0
	beq _08006054
	cmp r0, #2
	beq _08006080
	b _0800639A
_08006046:
	cmp r0, #0x32
	bne _0800604C
	b _0800618C
_0800604C:
	cmp r0, #0x33
	bne _08006052
	b _080061D4
_08006052:
	b _0800639A
_08006054:
	movs r0, #2
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r2]
	movs r0, #7
	ldrsb r0, [r2, r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_080073F8
	bl sub_08001D9C
	bl sub_08003948
	movs r0, #0x65
	bl sub_0803B4DC
	bl sub_08007354
	b _0800639A
_08006080:
	ldr r1, _080060D8 @ =gUnknown_03002EFC
	ldrb r0, [r1]
	subs r0, #8
	strb r0, [r1]
	ldrb r0, [r1]
	cmp r0, #0x77
	bls _08006090
	b _0800639A
_08006090:
	movs r0, #0x78
	strb r0, [r1]
	movs r0, #4
	strh r0, [r2, #2]
	bl sub_08007328
	ldr r0, [r6]
	movs r4, #0x3a
	ldrsh r5, [r0, r4]
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _080060AA
	b _0800639A
_080060AA:
	ldr r3, _080060DC @ =gUnknown_0200B0D0
	adds r6, r0, #0
	movs r2, #9
	movs r1, #0x31
	rsbs r1, r1, #0
_080060B4:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r4, r0, r3
	adds r5, #1
	ldr r0, [r4]
	orrs r0, r2
	ands r0, r1
	str r0, [r4]
	cmp r5, r8
	blt _080060CE
	mov r4, r8
	subs r5, r5, r4
_080060CE:
	subs r6, #1
	cmp r6, #0
	bne _080060B4
	b _0800639A
	.align 2, 0
_080060D8: .4byte gUnknown_03002EFC
_080060DC: .4byte gUnknown_0200B0D0
_080060E0:
	movs r3, #0
	movs r0, #0x3a
	ldrsh r5, [r2, r0]
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _080060EE
	b _0800639A
_080060EE:
	ldr r2, _0800613C @ =gUnknown_0200B0D0
	mov ip, r2
	mov sb, r6
	adds r6, r1, #0
_080060F6:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	mov r1, ip
	adds r4, r0, r1
	ldr r0, [r4, #0x10]
	ldr r2, _08006140 @ =0xFFFFFD00
	adds r0, r0, r2
	str r0, [r4, #0x10]
	asrs r0, r0, #8
	cmp r0, #0x6f
	bgt _08006114
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [r4, #0x10]
_08006114:
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0xc]
	asrs r0, r2, #8
	subs r7, r1, r0
	cmp r7, #0
	bge _08006148
	ldr r0, [r4, #0x14]
	ldr r1, _08006144 @ =0xFFFFFE00
	adds r0, r0, r1
	str r0, [r4, #0x14]
	adds r0, r2, r0
	str r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r2, #8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _0800617A
	b _08006164
	.align 2, 0
_0800613C: .4byte gUnknown_0200B0D0
_08006140: .4byte 0xFFFFFD00
_08006144: .4byte 0xFFFFFE00
_08006148:
	cmp r7, #0
	ble _0800616A
	ldr r0, [r4, #0x14]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [r4, #0x14]
	adds r0, r2, r0
	str r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r2, #8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0800617A
_08006164:
	lsls r0, r1, #8
	str r0, [r4, #0xc]
	b _0800617A
_0800616A:
	adds r3, #1
	ldr r4, [sp, #4]
	cmp r3, r4
	blt _0800617A
	mov r0, sb
	ldr r1, [r0]
	movs r0, #0x32
	strh r0, [r1, #2]
_0800617A:
	adds r5, #1
	cmp r5, r8
	blt _08006184
	mov r1, r8
	subs r5, r5, r1
_08006184:
	subs r6, #1
	cmp r6, #0
	bne _080060F6
	b _0800639A
_0800618C:
	bl sub_08007328
	ldr r2, _080061FC @ =gUnknown_0200B0D0
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r2
	ldr r5, _08006200 @ =gUnknown_084886F8
	ldr r2, [r6]
	movs r1, #7
	ldrsb r1, [r2, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r3, r0, #3
	adds r0, r1, #0
	adds r1, r3, #0
	adds r1, #0x1c
	cmp r0, #0
	bne _080061B4
	adds r1, #8
_080061B4:
	adds r0, r1, r5
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	ldrh r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x33
	strh r0, [r2, #2]
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080061D4
	bl sub_08002DEC
_080061D4:
	ldr r1, _08006204 @ =gUnknown_0808D7DC
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r2, [r3, #4]
	movs r0, #4
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _08006208
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0]
	movs r0, #7
	ldrsb r0, [r1, r0]
	movs r2, #0x50
	cmp r0, #0
	bne _080061F8
	movs r2, #0x5a
_080061F8:
	strh r2, [r1, #2]
	b _0800639A
	.align 2, 0
_080061FC: .4byte gUnknown_0200B0D0
_08006200: .4byte gUnknown_084886F8
_08006204: .4byte gUnknown_0808D7DC
_08006208:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08006226
	mov r4, sl
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08006222
	b _0800639A
_08006222:
	movs r0, #0x5a
	b _08006398
_08006226:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08006244
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [r0]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _08006240
	b _0800639A
_08006240:
	movs r0, #0x50
	b _08006398
_08006244:
	ldrh r1, [r3]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080062BC
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0]
	movs r0, #0x34
	strh r0, [r1, #2]
	ldr r5, [sp, #4]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08006276
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r5, r0
	cmp r5, #0x10
	ble _08006288
	subs r5, #0x11
	b _08006288
_08006276:
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r5, r0
	cmp r5, #0x13
	ble _08006288
	subs r5, #0x14
_08006288:
	bl sub_08007328
	adds r6, r0, #0
	ldr r0, _080062B4 @ =gUnknown_0200B0D0
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, _080062B8 @ =gUnknown_0200B224
	lsls r0, r5, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1, #4]
	strh r6, [r1, #6]
	ldr r0, [r1]
	movs r2, #9
	orrs r0, r2
	str r0, [r1]
	movs r0, #0x64
	bl sub_0803B4DC
	b _08006326
	.align 2, 0
_080062B4: .4byte gUnknown_0200B0D0
_080062B8: .4byte gUnknown_0200B224
_080062BC:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08006326
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [r0]
	movs r0, #0x35
	strh r0, [r1, #2]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080062EA
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r5, r0, #1
	cmp r5, #0
	bge _080062FC
	adds r5, #0x11
	b _080062FC
_080062EA:
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r5, r0, #1
	cmp r5, #0
	bge _080062FC
	adds r5, #0x14
_080062FC:
	bl sub_08007328
	adds r6, r0, #0
	ldr r0, _0800633C @ =gUnknown_0200B0D0
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, _08006340 @ =gUnknown_0200B224
	lsls r0, r5, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1, #4]
	strh r6, [r1, #6]
	ldr r0, [r1]
	movs r2, #9
	orrs r0, r2
	str r0, [r1]
	movs r0, #0x64
	bl sub_0803B4DC
_08006326:
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08006344
	movs r2, #0x3a
	ldrsh r0, [r1, r2]
	adds r5, r0, #4
	b _0800634A
	.align 2, 0
_0800633C: .4byte gUnknown_0200B0D0
_08006340: .4byte gUnknown_0200B224
_08006344:
	movs r2, #0x3a
	ldrsh r0, [r1, r2]
	adds r5, r0, #3
_0800634A:
	ldr r0, [r4]
	ldr r1, [r0]
	ldrh r0, [r1, #2]
	ldrh r2, [r1, #4]
	orrs r0, r2
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08006366
	mov r4, sl
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #0x28
	b _08006398
_08006366:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08006380
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r2, [r1]
	ldr r0, _0800637C @ =0x0000FFDF
	ands r0, r2
	b _08006394
	.align 2, 0
_0800637C: .4byte 0x0000FFDF
_08006380:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0800639A
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0]
	ldrh r2, [r1]
	movs r0, #0x20
	orrs r0, r2
_08006394:
	strh r0, [r1]
	movs r0, #0x3c
_08006398:
	strh r0, [r1, #2]
_0800639A:
	mov r4, sl
	ldr r7, [r4]
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r0, #0x34
	beq _080063AC
	cmp r0, #0x35
	beq _08006498
	b _0800658E
_080063AC:
	bl sub_08007328
	adds r6, r0, #0
	ldr r0, _0800646C @ =gUnknown_0200B0D0
	mov sb, r0
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	mov r1, sb
	adds r4, r0, r1
	ldr r5, _08006470 @ =gUnknown_084886F8
	ldr r2, [r7]
	movs r1, #7
	ldrsb r1, [r2, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r3, r0, #3
	adds r0, r1, #0
	adds r1, r3, #0
	adds r1, #0x1c
	cmp r0, #0
	bne _080063DA
	adds r1, #8
_080063DA:
	adds r0, r1, r5
	ldr r0, [r0]
	strh r0, [r4, #8]
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [r4, #0x10]
	movs r4, #0x3a
	ldrsh r5, [r2, r4]
	movs r6, #0
	cmp r6, r8
	bge _0800643A
	mov ip, sb
	ldr r0, _08006474 @ =gUnknown_08488748
	mov sb, r0
	adds r2, r7, #0
	movs r3, #0
_08006402:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	mov r1, ip
	adds r4, r0, r1
	ldr r0, [r2]
	movs r1, #7
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r6, r0
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r4, #8]
	str r3, [r4, #0x14]
	adds r5, #1
	cmp r5, r8
	blt _08006434
	mov r4, r8
	subs r5, r5, r4
_08006434:
	adds r6, #1
	cmp r6, r8
	blt _08006402
_0800643A:
	mov r0, sl
	ldr r2, [r0]
	ldr r1, [r2]
	movs r0, #0x36
	strh r0, [r1, #2]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08006478
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x10
	bgt _08006466
	b _0800658E
_08006466:
	adds r0, r2, #0
	subs r0, #0x11
	b _0800658C
	.align 2, 0
_0800646C: .4byte gUnknown_0200B0D0
_08006470: .4byte gUnknown_084886F8
_08006474: .4byte gUnknown_08488748
_08006478:
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x38
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x13
	bgt _08006492
	b _0800658E
_08006492:
	adds r0, r2, #0
	subs r0, #0x14
	b _0800658C
_08006498:
	bl sub_08007328
	adds r6, r0, #0
	ldr r1, _080064C8 @ =gUnknown_0200B0D0
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r4, r0, r1
	ldr r3, _080064CC @ =gUnknown_084886F8
	ldr r2, [r7]
	movs r1, #7
	ldrsb r1, [r2, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r1, [r0]
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080064D0
	adds r0, r1, #0
	subs r0, #0x18
	b _080064D4
	.align 2, 0
_080064C8: .4byte gUnknown_0200B0D0
_080064CC: .4byte gUnknown_084886F8
_080064D0:
	adds r0, r1, #0
	subs r0, #0x21
_080064D4:
	strh r0, [r4, #8]
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [r4, #0x10]
	mov r2, sl
	ldr r1, [r2]
	ldr r0, [r1]
	movs r4, #0x3a
	ldrsh r5, [r0, r4]
	movs r6, #0
	cmp r6, r8
	bge _08006536
	ldr r0, _08006568 @ =gUnknown_0200B0D0
	mov ip, r0
	ldr r2, _0800656C @ =gUnknown_0848875C
	mov sb, r2
	adds r7, r1, #0
	movs r3, #0
_08006500:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	mov r1, ip
	adds r4, r0, r1
	lsls r2, r6, #2
	ldr r0, [r7]
	movs r1, #7
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r2, r0
	add r2, sb
	ldr r1, [r2]
	ldrh r0, [r4, #8]
	adds r0, r0, r1
	strh r0, [r4, #8]
	str r3, [r4, #0x14]
	adds r5, #1
	cmp r5, r8
	blt _08006530
	mov r2, r8
	subs r5, r5, r2
_08006530:
	adds r6, #1
	cmp r6, r8
	blt _08006500
_08006536:
	mov r4, sl
	ldr r2, [r4]
	ldr r1, [r2]
	movs r0, #0x37
	strh r0, [r1, #2]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08006570
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0800658E
	adds r0, r2, #0
	adds r0, #0x11
	b _0800658C
	.align 2, 0
_08006568: .4byte gUnknown_0200B0D0
_0800656C: .4byte gUnknown_0848875C
_08006570:
	adds r1, #0x38
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x38
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0800658E
	adds r0, r2, #0
	adds r0, #0x14
_0800658C:
	strb r0, [r1]
_0800658E:
	mov r0, sl
	ldr r1, [r0]
	ldr r0, [r1]
	ldrh r2, [r0, #2]
	cmp r2, #0x36
	bge _0800659C
	b _0800682E
_0800659C:
	cmp r2, #0x37
	ble _080065AE
	cmp r2, #0x3c
	bne _080065A6
	b _080066A6
_080065A6:
	cmp r2, #0x41
	bne _080065AC
	b _080066FA
_080065AC:
	b _0800682E
_080065AE:
	movs r3, #0
	movs r2, #0x3a
	ldrsh r5, [r0, r2]
	mov r4, r8
	cmp r4, #0
	bne _080065BC
	b _0800682E
_080065BC:
	ldr r0, _08006604 @ =gUnknown_0200B0D0
	mov ip, r0
	mov sb, r1
	mov r6, r8
_080065C4:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	mov r1, ip
	adds r4, r0, r1
	movs r2, #8
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	subs r7, r1, r0
	cmp r7, #0
	bge _08006610
	ldr r1, [r4, #0x14]
	ldr r0, _08006608 @ =0xFFFFFA00
	subs r0, r0, r1
	asrs r7, r0, #2
	adds r1, r1, r7
	str r1, [r4, #0x14]
	ldr r0, _0800660C @ =0xFFFFFB80
	cmp r1, r0
	bgt _080065F0
	str r0, [r4, #0x14]
_080065F0:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _08006694
	b _08006640
	.align 2, 0
_08006604: .4byte gUnknown_0200B0D0
_08006608: .4byte 0xFFFFFA00
_0800660C: .4byte 0xFFFFFB80
_08006610:
	cmp r7, #0
	ble _0800664C
	ldr r0, [r4, #0x14]
	movs r1, #0xc0
	lsls r1, r1, #3
	subs r1, r1, r0
	asrs r7, r1, #2
	adds r0, r0, r7
	str r0, [r4, #0x14]
	ldr r1, _08006648 @ =0x0000047F
	cmp r0, r1
	ble _0800662E
	movs r0, #0x90
	lsls r0, r0, #3
	str r0, [r4, #0x14]
_0800662E:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _08006694
_08006640:
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	b _08006694
	.align 2, 0
_08006648: .4byte 0x0000047F
_0800664C:
	adds r3, #1
	cmp r3, r8
	blt _08006694
	mov r4, sb
	ldr r1, [r4]
	ldrh r0, [r1, #2]
	cmp r0, #0x36
	bne _08006670
	ldrh r0, [r1, #0x3a]
	adds r0, #1
	movs r2, #0
	strh r0, [r1, #0x3a]
	movs r4, #0x3a
	ldrsh r0, [r1, r4]
	ldr r4, [sp, #4]
	cmp r0, r4
	ble _08006670
	strh r2, [r1, #0x3a]
_08006670:
	mov r0, sb
	ldr r1, [r0]
	ldrh r0, [r1, #2]
	cmp r0, #0x37
	bne _0800668C
	ldrh r0, [r1, #0x3a]
	subs r0, #1
	strh r0, [r1, #0x3a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800668C
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r1, #0x3a]
_0800668C:
	mov r4, sb
	ldr r1, [r4]
	movs r0, #0x32
	strh r0, [r1, #2]
_08006694:
	adds r5, #1
	cmp r5, r8
	blt _0800669E
	mov r0, r8
	subs r5, r5, r0
_0800669E:
	subs r6, #1
	cmp r6, #0
	bne _080065C4
	b _0800682E
_080066A6:
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	movs r1, #0x65
	cmp r0, #0
	beq _080066B4
	movs r1, #0x66
_080066B4:
	adds r0, r1, #0
	bl sub_0803B4DC
	mov r1, r8
	cmp r1, #0
	beq _080066D6
	movs r2, #2
	rsbs r2, r2, #0
	ldr r1, _08006774 @ =gUnknown_0200B0D0
	mov r6, r8
_080066C8:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bne _080066C8
_080066D6:
	mov r2, sl
	ldr r4, [r2]
	ldr r2, [r4]
	ldrh r1, [r2]
	ldr r0, _08006778 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	bl sub_08007B74
	ldr r1, [r4]
	movs r0, #0x1e
	str r0, [r1, #0xc]
	movs r0, #0x41
	strh r0, [r1, #2]
	ldrh r2, [r1]
	ldr r0, _0800677C @ =0x0000FFBF
	ands r0, r2
	strh r0, [r1]
_080066FA:
	ldr r1, _08006780 @ =gUnknown_03002EFC
	ldrb r0, [r1]
	adds r0, #6
	strb r0, [r1]
	ldrb r0, [r1]
	cmp r0, #0x9f
	bhi _0800670A
	b _0800682E
_0800670A:
	movs r0, #0xa0
	strb r0, [r1]
	mov r0, sl
	ldr r4, [r0]
	ldr r1, [r4]
	movs r0, #0x46
	strh r0, [r1, #2]
	bl sub_08001D8C
	bl sub_08003934
	ldr r2, [r4]
	ldrh r3, [r2]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08006784
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0800674E
	ldrh r0, [r2, #0x2c]
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x30
	ldrb r1, [r1]
	adds r0, #0x2e
	strb r1, [r0]
_0800674E:
	ldr r2, [r4]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800682A
	ldrh r0, [r2, #0x26]
	strh r0, [r2, #0x24]
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r0, #0x2f
	b _08006828
	.align 2, 0
_08006774: .4byte gUnknown_0200B0D0
_08006778: .4byte 0x0000FFEF
_0800677C: .4byte 0x0000FFBF
_08006780: .4byte gUnknown_03002EFC
_08006784:
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080067CC
	movs r1, #0x3a
	ldrsh r0, [r2, r1]
	adds r5, r0, #4
	cmp r5, #9
	ble _08006798
	subs r5, r0, #6
_08006798:
	ldr r1, _080067C8 @ =gUnknown_0200B0D0
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	strh r0, [r2, #0x2a]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0800682A
	ldrh r0, [r2, #0x26]
	strh r0, [r2, #0x24]
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r0, #0x2f
	b _08006828
	.align 2, 0
_080067C8: .4byte gUnknown_0200B0D0
_080067CC:
	movs r4, #0x3a
	ldrsh r0, [r2, r4]
	adds r5, r0, #3
	cmp r5, #7
	ble _080067D8
	subs r5, r0, #5
_080067D8:
	ldr r1, _08006848 @ =gUnknown_0200B0D0
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r1, r0, #0
	cmp r1, #0x19
	beq _080067FE
	movs r1, #0x3f
	ands r1, r0
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #6
	orrs r1, r0
_080067FE:
	strh r1, [r2, #0x24]
	mov r0, sl
	ldr r3, [r0]
	ldr r2, [r3]
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800682A
	ldrh r0, [r2, #0x2c]
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x30
	ldrb r1, [r1]
	adds r0, #0x2e
_08006828:
	strb r1, [r0]
_0800682A:
	bl sub_08002E3C
_0800682E:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #0x46
	cmp r0, #0x15
	bls _0800683E
	b _08006A82
_0800683E:
	lsls r0, r0, #2
	ldr r1, _0800684C @ =_08006850
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006848: .4byte gUnknown_0200B0D0
_0800684C: .4byte _08006850
_08006850: @ jump table
	.4byte _080068A8 @ case 0
	.4byte _08006A82 @ case 1
	.4byte _08006A82 @ case 2
	.4byte _08006A82 @ case 3
	.4byte _08006A82 @ case 4
	.4byte _08006A82 @ case 5
	.4byte _08006A82 @ case 6
	.4byte _08006A82 @ case 7
	.4byte _08006A82 @ case 8
	.4byte _08006A82 @ case 9
	.4byte _080068C2 @ case 10
	.4byte _080068F0 @ case 11
	.4byte _08006A82 @ case 12
	.4byte _08006A82 @ case 13
	.4byte _08006A82 @ case 14
	.4byte _08006A82 @ case 15
	.4byte _08006A82 @ case 16
	.4byte _08006A82 @ case 17
	.4byte _08006A82 @ case 18
	.4byte _08006A82 @ case 19
	.4byte _080069A0 @ case 20
	.4byte _080069E0 @ case 21
_080068A8:
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x50
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0x6a
	ble _080068BA
	b _08006A82
_080068BA:
	movs r0, #1
	bl sub_0800056C
	b _08006A82
_080068C2:
	bl sub_08007B74
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x3a]
	movs r2, #0x30
	ldr r1, _080068EC @ =gUnknown_0200B0D0
	movs r6, #9
_080068D6:
	ldr r0, [r1]
	orrs r0, r2
	str r0, [r1]
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _080068D6
	mov r2, sl
	ldr r0, [r2]
	b _080069C6
	.align 2, 0
_080068EC: .4byte gUnknown_0200B0D0
_080068F0:
	mov r4, sl
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x56
	movs r1, #0
	ldrsh r7, [r0, r1]
	subs r7, #0x40
	cmp r7, #0xf
	bgt _08006904
	movs r7, #0x10
_08006904:
	strh r7, [r0]
	ldr r4, _08006998 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #4
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	adds r0, r5, #0
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r1, #0
	ldrsh r4, [r4, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	cmp r7, #0
	bne _08006936
	movs r1, #2
_08006936:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r4, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r1, r7, #0
	cmp r7, #0
	bne _08006952
	movs r1, #2
_08006952:
	adds r0, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetObjAffine
	cmp r7, #0x10
	ble _08006970
	b _08006A82
_08006970:
	movs r2, #0x32
	rsbs r2, r2, #0
	ldr r1, _0800699C @ =gUnknown_0200B0D0
	movs r6, #9
_08006978:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006978
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0x64
	strh r0, [r1, #2]
	strb r2, [r1, #7]
	b _08006A82
	.align 2, 0
_08006998: .4byte gSinLut
_0800699C: .4byte gUnknown_0200B0D0
_080069A0:
	bl sub_08007B74
	mov r4, sl
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x3a]
	movs r2, #0x30
	ldr r1, _080069DC @ =gUnknown_0200B0D0
	movs r6, #9
_080069B4:
	ldr r0, [r1]
	orrs r0, r2
	str r0, [r1]
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _080069B4
	mov r1, sl
	ldr r0, [r1]
_080069C6:
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x56
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	b _08006A82
	.align 2, 0
_080069DC: .4byte gUnknown_0200B0D0
_080069E0:
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x56
	movs r4, #0
	ldrsh r7, [r0, r4]
	subs r7, #0x40
	cmp r7, #0xf
	bgt _080069F4
	movs r7, #0x10
_080069F4:
	strh r7, [r0]
	ldr r4, _08006A98 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	adds r0, r5, #0
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	cmp r7, #0
	bne _08006A26
	movs r1, #2
_08006A26:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r4, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r1, r7, #0
	cmp r7, #0
	bne _08006A42
	movs r1, #2
_08006A42:
	adds r0, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0xc]
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetObjAffine
	cmp r7, #0x10
	bgt _08006A82
	movs r2, #0x32
	rsbs r2, r2, #0
	ldr r1, _08006A9C @ =gUnknown_0200B0D0
	movs r6, #9
_08006A66:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006A66
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [r0]
	movs r0, #0x64
	strh r0, [r1, #2]
	movs r0, #1
	strb r0, [r1, #7]
_08006A82:
	mov r2, sl
	ldr r4, [r2]
	ldr r2, [r4]
	ldrh r0, [r2, #2]
	cmp r0, #0x65
	beq _08006AEE
	cmp r0, #0x65
	bgt _08006AA0
	cmp r0, #0x64
	beq _08006AA6
	b _08006B6E
	.align 2, 0
_08006A98: .4byte gSinLut
_08006A9C: .4byte gUnknown_0200B0D0
_08006AA0:
	cmp r0, #0x66
	beq _08006B02
	b _08006B6E
_08006AA6:
	movs r3, #7
	ldrsb r3, [r2, r3]
	adds r0, r3, #0
	cmp r0, #0
	bne _08006AB6
	adds r0, r2, #0
	adds r0, #0x2e
	b _08006ABA
_08006AB6:
	adds r0, r2, #0
	adds r0, #0x2f
_08006ABA:
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r3, #0
	bl sub_080078E4
	mov r0, sl
	ldr r4, [r0]
	ldr r0, [r4]
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_080073F8
	bl sub_08007354
	bl sub_08002DEC
	ldr r1, [r4]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	movs r0, #0xa
	str r0, [r1, #0xc]
	b _08006B6E
_08006AEE:
	ldr r0, [r2, #0xc]
	adds r1, r0, #0
	subs r0, #1
	str r0, [r2, #0xc]
	cmp r1, #0
	bgt _08006B6E
	ldrh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #2]
	b _08006B6E
_08006B02:
	movs r0, #0x65
	bl sub_0803B4DC
	ldr r1, [r4]
	movs r0, #4
	strh r0, [r1, #2]
	movs r2, #7
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	cmp r0, #0
	bne _08006B1E
	adds r0, r1, #0
	adds r0, #0x2e
	b _08006B22
_08006B1E:
	adds r0, r1, #0
	adds r0, #0x2f
_08006B22:
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl sub_080078E4
	bl sub_08007328
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	movs r2, #0x3a
	ldrsh r5, [r0, r2]
	mov r0, r8
	subs r0, #1
	cmp r0, #0
	ble _08006B6E
	ldr r3, _08006B88 @ =gUnknown_0200B0D0
	movs r2, #1
	movs r1, #0x31
	rsbs r1, r1, #0
	mov r6, r8
	subs r6, #1
_08006B4E:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r4, r0, r3
	adds r5, #1
	ldr r0, [r4]
	orrs r0, r2
	ands r0, r1
	str r0, [r4]
	cmp r5, r8
	blt _08006B68
	mov r4, r8
	subs r5, r5, r4
_08006B68:
	subs r6, #1
	cmp r6, #0
	bne _08006B4E
_08006B6E:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #0x28
	cmp r0, #8
	bls _08006B7E
	b _08007312
_08006B7E:
	lsls r0, r0, #2
	ldr r1, _08006B8C @ =_08006B90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006B88: .4byte gUnknown_0200B0D0
_08006B8C: .4byte _08006B90
_08006B90: @ jump table
	.4byte _08006BB4 @ case 0
	.4byte _08007312 @ case 1
	.4byte _08006DB4 @ case 2
	.4byte _08006F04 @ case 3
	.4byte _08006FB0 @ case 4
	.4byte _08007180 @ case 5
	.4byte _08007230 @ case 6
	.4byte _08007312 @ case 7
	.4byte _080072E0 @ case 8
_08006BB4:
	mov r2, sl
	ldr r6, [r2]
	ldr r2, [r6]
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08006C80
	movs r4, #0x3a
	ldrsh r0, [r2, r4]
	adds r5, r0, #4
	cmp r5, #9
	ble _08006BCE
	subs r5, r0, #6
_08006BCE:
	ldr r1, _08006BF4 @ =gUnknown_0200B0D0
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrh r0, [r4, #4]
	bl sub_0800C7E8
	cmp r0, #0
	beq _08006BEC
	ldrh r0, [r4, #4]
	cmp r0, #0x10
	beq _08006BEC
	cmp r0, #0x11
	bne _08006BF8
_08006BEC:
	mov r1, sl
	ldr r0, [r1]
	b _0800730C
	.align 2, 0
_08006BF4: .4byte gUnknown_0200B0D0
_08006BF8:
	ldr r0, [r6]
	adds r0, #0x2e
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, _08006C20 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08006C24
	adds r4, #1
	cmp r4, #4
	ble _08006C16
	movs r4, #0
_08006C16:
	movs r0, #0x64
	bl sub_0803B4DC
	b _08006C3A
	.align 2, 0
_08006C20: .4byte gpKeySt
_08006C24:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08006C3A
	subs r4, #1
	cmp r4, #0
	bge _08006C34
	movs r4, #4
_08006C34:
	movs r0, #0x64
	bl sub_0803B4DC
_08006C3A:
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x32
	strb r4, [r0]
	ldr r4, _08006C74 @ =gUnknown_0808D7E0
	mov sb, r4
	ldr r7, _08006C78 @ =gUnknown_0808D7E4
	ldr r5, _08006C7C @ =gUnknown_0200B0D0
	movs r6, #9
_08006C4E:
	ldrh r0, [r5, #4]
	bl sub_0800C7E8
	cmp r0, #0
	beq _08006C6A
	ldrh r0, [r5, #4]
	cmp r0, #0x10
	beq _08006C6A
	cmp r0, #0x11
	beq _08006C6A
	ldr r0, [r5]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r5]
_08006C6A:
	adds r5, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006C4E
	b _08006D14
	.align 2, 0
_08006C74: .4byte gUnknown_0808D7E0
_08006C78: .4byte gUnknown_0808D7E4
_08006C7C: .4byte gUnknown_0200B0D0
_08006C80:
	movs r1, #0x3a
	ldrsh r0, [r2, r1]
	adds r5, r0, #3
	cmp r5, #7
	ble _08006C8C
	subs r5, r0, #5
_08006C8C:
	ldr r0, _08006CA4 @ =gUnknown_0200B0D0
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	cmp r0, #0x19
	bne _08006CA8
	movs r0, #0x33
	strh r0, [r2, #2]
	b _08007312
	.align 2, 0
_08006CA4: .4byte gUnknown_0200B0D0
_08006CA8:
	adds r0, r2, #0
	adds r0, #0x2f
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, _08006CD0 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08006CD4
	adds r4, #1
	cmp r4, #4
	ble _08006CC6
	movs r4, #1
_08006CC6:
	movs r0, #0x64
	bl sub_0803B4DC
	b _08006CEA
	.align 2, 0
_08006CD0: .4byte gpKeySt
_08006CD4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08006CEA
	subs r4, #1
	cmp r4, #0
	bgt _08006CE4
	movs r4, #4
_08006CE4:
	movs r0, #0x64
	bl sub_0803B4DC
_08006CEA:
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x32
	strb r4, [r0]
	ldr r4, _08006DA8 @ =gUnknown_0808D7E0
	mov sb, r4
	ldr r7, _08006DAC @ =gUnknown_0808D7E4
	movs r2, #0x10
	ldr r1, _08006DB0 @ =gUnknown_0200B0D0
	movs r6, #9
_08006D00:
	ldrh r0, [r1, #4]
	cmp r0, #0x19
	beq _08006D0C
	ldr r0, [r1]
	orrs r0, r2
	str r0, [r1]
_08006D0C:
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006D00
_08006D14:
	mov r0, sl
	ldr r0, [r0]
	mov sl, r0
	ldr r0, [r0]
	adds r0, #0x33
	movs r1, #0
	strb r1, [r0]
	mov r1, sl
	ldr r2, [r1]
	ldr r3, [r7]
	adds r5, r2, #0
	adds r5, #0x33
	ldrb r0, [r5]
	adds r1, r0, #1
	strb r1, [r5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r2, #0x56
	strh r0, [r2]
	mov r2, sb
	ldr r4, [r2]
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov sb, r1
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	mov r0, sb
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r4, [r4, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r2, sl
	ldr r1, [r2]
	movs r0, #0x2a
	b _08007310
	.align 2, 0
_08006DA8: .4byte gUnknown_0808D7E0
_08006DAC: .4byte gUnknown_0808D7E4
_08006DB0: .4byte gUnknown_0200B0D0
_08006DB4:
	ldr r4, _08006E14 @ =gUnknown_084886DC
	mov r0, sl
	ldr r3, [r0]
	ldr r1, [r3]
	adds r1, #0x33
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	adds r0, r0, r4
	movs r1, #0
	ldrsh r7, [r0, r1]
	ldr r3, [r3]
	adds r0, r3, #0
	adds r0, #0x56
	strh r7, [r0]
	cmp r7, #0
	bne _08006E3C
	ldrh r0, [r3, #2]
	adds r0, #1
	strh r0, [r3, #2]
	movs r0, #7
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08006E1C
	ldr r4, _08006E18 @ =gUnknown_0200B0D0
	movs r6, #9
_08006DEC:
	ldrh r0, [r4, #4]
	bl sub_0800C7E8
	cmp r0, #0
	beq _08006E08
	ldrh r0, [r4, #4]
	cmp r0, #0x10
	beq _08006E08
	cmp r0, #0x11
	beq _08006E08
	ldr r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r4]
_08006E08:
	adds r4, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006DEC
	b _08006E90
	.align 2, 0
_08006E14: .4byte gUnknown_084886DC
_08006E18: .4byte gUnknown_0200B0D0
_08006E1C:
	movs r2, #0x40
	ldr r1, _08006E38 @ =gUnknown_0200B0D0
	movs r6, #9
_08006E22:
	ldrh r0, [r1, #4]
	cmp r0, #0x19
	beq _08006E2E
	ldr r0, [r1]
	orrs r0, r2
	str r0, [r1]
_08006E2E:
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006E22
	b _08006E90
	.align 2, 0
_08006E38: .4byte gUnknown_0200B0D0
_08006E3C:
	movs r0, #7
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08006E74
	ldr r4, _08006E70 @ =gUnknown_0200B0D0
	movs r6, #9
_08006E48:
	ldrh r0, [r4, #4]
	bl sub_0800C7E8
	cmp r0, #0
	beq _08006E66
	ldrh r0, [r4, #4]
	cmp r0, #0x10
	beq _08006E66
	cmp r0, #0x11
	beq _08006E66
	ldr r0, [r4]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
_08006E66:
	adds r4, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006E48
	b _08006E90
	.align 2, 0
_08006E70: .4byte gUnknown_0200B0D0
_08006E74:
	movs r2, #0x41
	rsbs r2, r2, #0
	ldr r1, _08006EFC @ =gUnknown_0200B0D0
	movs r6, #9
_08006E7C:
	ldrh r0, [r1, #4]
	cmp r0, #0x19
	beq _08006E88
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
_08006E88:
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006E7C
_08006E90:
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x56
	strh r7, [r0]
	cmp r7, #0
	bne _08006EA0
	b _08007312
_08006EA0:
	ldr r4, _08006F00 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	mov r0, r8
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	b _080072CC
	.align 2, 0
_08006EFC: .4byte gUnknown_0200B0D0
_08006F00: .4byte gSinLut
_08006F04:
	ldr r4, _08006F6C @ =gUnknown_084886DC
	mov r2, sl
	ldr r3, [r2]
	ldr r1, [r3]
	adds r1, #0x33
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	adds r0, r0, r4
	movs r4, #0
	ldrsh r7, [r0, r4]
	ldr r3, [r3]
	adds r0, r3, #0
	adds r0, #0x56
	strh r7, [r0]
	cmp r7, #0
	bne _08006F2C
	b _08007312
_08006F2C:
	ldrh r0, [r3, #2]
	adds r0, #1
	strh r0, [r3, #2]
	movs r0, #7
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08006F78
	ldr r0, _08006F70 @ =gUnknown_0808D7E0
	mov sb, r0
	ldr r5, _08006F74 @ =gUnknown_0200B0D0
	movs r6, #9
_08006F42:
	ldrh r0, [r5, #4]
	bl sub_0800C7E8
	cmp r0, #0
	beq _08006F60
	ldrh r0, [r5, #4]
	cmp r0, #0x10
	beq _08006F60
	cmp r0, #0x11
	beq _08006F60
	ldr r0, [r5]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5]
_08006F60:
	adds r5, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006F42
	b _08006F98
	.align 2, 0
_08006F6C: .4byte gUnknown_084886DC
_08006F70: .4byte gUnknown_0808D7E0
_08006F74: .4byte gUnknown_0200B0D0
_08006F78:
	ldr r1, _08006FA8 @ =gUnknown_0808D7E0
	mov sb, r1
	movs r2, #0x41
	rsbs r2, r2, #0
	ldr r1, _08006FAC @ =gUnknown_0200B0D0
	movs r6, #9
_08006F84:
	ldrh r0, [r1, #4]
	cmp r0, #0x19
	beq _08006F90
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
_08006F90:
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08006F84
_08006F98:
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x56
	strh r7, [r0]
	mov r0, sb
	ldr r4, [r0]
	b _08007270
	.align 2, 0
_08006FA8: .4byte gUnknown_0808D7E0
_08006FAC: .4byte gUnknown_0200B0D0
_08006FB0:
	ldr r3, _08007024 @ =gUnknown_084886DC
	mov r2, sl
	ldr r4, [r2]
	ldr r1, [r4]
	adds r1, #0x33
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	adds r0, r0, r3
	movs r1, #0
	ldrsh r7, [r0, r1]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x56
	strh r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _08006FE4
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	movs r7, #0x80
	lsls r7, r7, #1
_08006FE4:
	cmp r7, #0
	blt _080070B0
	ldr r2, [r4]
	ldrh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #2]
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0800702C
	movs r4, #0x3a
	ldrsh r0, [r2, r4]
	adds r5, r0, #4
	cmp r5, #9
	ble _08007004
	subs r5, r0, #6
_08007004:
	ldr r1, _08007028 @ =gUnknown_0200B0D0
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_080077EC
	bl sub_08007B74
	b _0800703E
	.align 2, 0
_08007024: .4byte gUnknown_084886DC
_08007028: .4byte gUnknown_0200B0D0
_0800702C:
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080078D4
	bl sub_08007B74
_0800703E:
	cmp r7, #0
	bne _080070B0
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08007088
	ldr r2, _08007080 @ =gUnknown_0808D7E0
	mov sb, r2
	ldr r5, _08007084 @ =gUnknown_0200B0D0
	movs r6, #9
_0800705A:
	ldrh r0, [r5, #4]
	bl sub_0800C7E8
	cmp r0, #0
	beq _08007076
	ldrh r0, [r5, #4]
	cmp r0, #0x10
	beq _08007076
	cmp r0, #0x11
	beq _08007076
	ldr r0, [r5]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r5]
_08007076:
	adds r5, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _0800705A
	b _08007168
	.align 2, 0
_08007080: .4byte gUnknown_0808D7E0
_08007084: .4byte gUnknown_0200B0D0
_08007088:
	ldr r4, _080070A8 @ =gUnknown_0808D7E0
	mov sb, r4
	movs r2, #0x40
	ldr r1, _080070AC @ =gUnknown_0200B0D0
	movs r6, #9
_08007092:
	ldrh r0, [r1, #4]
	cmp r0, #0x19
	beq _0800709E
	ldr r0, [r1]
	orrs r0, r2
	str r0, [r1]
_0800709E:
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08007092
	b _08007168
	.align 2, 0
_080070A8: .4byte gUnknown_0808D7E0
_080070AC: .4byte gUnknown_0200B0D0
_080070B0:
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [r0]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0800711C
	movs r2, #0x3a
	ldrsh r5, [r1, r2]
	ldr r4, _08007114 @ =gUnknown_0808D7E0
	mov sb, r4
	ldr r2, _08007118 @ =gUnknown_0200B0D0
	mov r8, r2
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r6, #9
_080070D4:
	ldrh r0, [r4, #4]
	str r2, [sp, #0x10]
	bl sub_0800C7E8
	ldr r2, [sp, #0x10]
	cmp r0, #0
	beq _080070FC
	ldrh r0, [r4, #4]
	cmp r0, #0x10
	beq _080070FC
	ldrh r0, [r2, #4]
	cmp r0, #0x11
	beq _080070FC
	ldr r0, [r4]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	str r0, [r4]
_080070FC:
	adds r4, #0x1c
	adds r5, #1
	ldr r0, [sp, #4]
	cmp r5, r0
	ble _0800710A
	mov r4, r8
	movs r5, #0
_0800710A:
	adds r2, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _080070D4
	b _08007168
	.align 2, 0
_08007114: .4byte gUnknown_0808D7E0
_08007118: .4byte gUnknown_0200B0D0
_0800711C:
	movs r2, #0x3a
	ldrsh r5, [r1, r2]
	ldr r4, _08007178 @ =gUnknown_0808D7E0
	mov sb, r4
	ldr r4, _0800717C @ =gUnknown_0200B0D0
	movs r6, #9
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r2, r0, r4
_08007130:
	ldrh r3, [r2, #4]
	cmp r3, #0x19
	beq _08007154
	ldr r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	movs r0, #0x3f
	ands r0, r3
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08007154
	movs r0, #8
	orrs r1, r0
	str r1, [r2]
_08007154:
	adds r2, #0x1c
	adds r5, #1
	ldr r0, [sp, #4]
	cmp r5, r0
	ble _08007162
	adds r2, r4, #0
	movs r5, #0
_08007162:
	subs r6, #1
	cmp r6, #0
	bge _08007130
_08007168:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #0x56
	strh r7, [r0]
	mov r2, sb
	ldr r4, [r2]
	b _08007270
	.align 2, 0
_08007178: .4byte gUnknown_0808D7E0
_0800717C: .4byte gUnknown_0200B0D0
_08007180:
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080071E8
	movs r4, #0x3a
	ldrsh r5, [r1, r4]
	ldr r7, _080071E4 @ =gUnknown_0200B0D0
	mov r8, r7
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r4, r0, r7
	movs r6, #9
_080071A6:
	ldrh r0, [r4, #4]
	bl sub_0800C7E8
	cmp r0, #0
	beq _080071CA
	ldrh r0, [r4, #4]
	cmp r0, #0x10
	beq _080071CA
	ldrh r0, [r7, #4]
	cmp r0, #0x11
	beq _080071CA
	ldr r0, [r4]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	str r0, [r4]
_080071CA:
	adds r4, #0x1c
	adds r5, #1
	ldr r0, [sp, #4]
	cmp r5, r0
	ble _080071D8
	mov r4, r8
	movs r5, #0
_080071D8:
	adds r7, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _080071A6
	b _08007230
	.align 2, 0
_080071E4: .4byte gUnknown_0200B0D0
_080071E8:
	movs r2, #0x3a
	ldrsh r5, [r1, r2]
	ldr r4, _080072D4 @ =gUnknown_0200B0D0
	movs r6, #9
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r2, r0, r4
_080071F8:
	ldrh r3, [r2, #4]
	cmp r3, #0x19
	beq _0800721C
	ldr r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	movs r0, #0x3f
	ands r0, r3
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800721C
	movs r0, #8
	orrs r1, r0
	str r1, [r2]
_0800721C:
	adds r2, #0x1c
	adds r5, #1
	ldr r0, [sp, #4]
	cmp r5, r0
	ble _0800722A
	adds r2, r4, #0
	movs r5, #0
_0800722A:
	subs r6, #1
	cmp r6, #0
	bge _080071F8
_08007230:
	mov r1, sl
	ldr r3, [r1]
	ldr r1, [r3]
	adds r1, #0x33
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _080072D8 @ =gUnknown_084886DC
	ldr r2, [r3]
	adds r0, r2, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r7, [r0, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _08007268
	movs r7, #0x80
	lsls r7, r7, #1
	movs r0, #0x30
	strh r0, [r2, #2]
	movs r0, #2
	str r0, [r2, #0xc]
_08007268:
	ldr r0, [r3]
	adds r0, #0x56
	strh r7, [r0]
	ldr r4, _080072DC @ =gSinLut
_08007270:
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #4
	adds r1, r7, #0
	cmp r7, #0
	bne _08007282
	movs r1, #2
_08007282:
	adds r0, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r4, #4
	adds r1, r7, #0
	cmp r1, #0
	bne _080072AE
	movs r1, #2
_080072AE:
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	adds r2, r6, #0
_080072CC:
	adds r3, r4, #0
	bl SetObjAffine
	b _08007312
	.align 2, 0
_080072D4: .4byte gUnknown_0200B0D0
_080072D8: .4byte gUnknown_084886DC
_080072DC: .4byte gSinLut
_080072E0:
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	adds r2, r0, #0
	subs r0, #1
	str r0, [r1, #0xc]
	cmp r2, #0
	bgt _08007312
	movs r2, #0x71
	rsbs r2, r2, #0
	ldr r1, _08007324 @ =gUnknown_0200B0D0
	movs r6, #9
_080072FA:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _080072FA
	mov r4, sl
	ldr r0, [r4]
_0800730C:
	ldr r1, [r0]
	movs r0, #0x33
_08007310:
	strh r0, [r1, #2]
_08007312:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007324: .4byte gUnknown_0200B0D0

