	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046030
sub_08046030: @ 0x08046030
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08046148 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r3, _0804614C @ =gUnknown_08125530
	ldr r1, _08046150 @ =0x00008360
	str r1, [sp]
	movs r1, #0
	movs r2, #1
	bl sub_08071948
	bl sub_0801F114
	ldr r4, _08046154 @ =0x06010000
	ldr r2, _08046158 @ =0x000001D5
	movs r0, #1
	adds r1, r4, #0
	movs r3, #0x14
	bl sub_0801F150
	movs r0, #0x3e
	bl sub_0801F234
	movs r0, #0x3f
	bl sub_0801F234
	movs r0, #0x40
	bl sub_0801F234
	movs r0, #0x41
	bl sub_0801F234
	movs r0, #0x42
	bl sub_0801F234
	ldr r2, _0804615C @ =0x000001E9
	movs r0, #0
	adds r1, r4, #0
	movs r3, #0x15
	bl sub_0801F150
	movs r0, #2
	bl sub_0801F234
	ldr r2, _08046160 @ =0x0000020F
	movs r0, #2
	adds r1, r4, #0
	movs r3, #0x11
	bl sub_0801F150
	movs r0, #0xa9
	bl sub_0801F234
	movs r0, #0
	bl sub_0801B780
	ldr r0, _08046164 @ =gUnknown_0809165C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08046168 @ =gUnknown_0812B49C
	ldr r1, _0804616C @ =0x060146A0
	movs r2, #0xc0
	lsls r2, r2, #1
	bl sub_08011C68
	ldr r0, _08046170 @ =gUnknown_0812B61C
	ldr r1, _08046174 @ =0x06014820
	movs r2, #0xe0
	bl sub_08011C68
	ldr r0, _08046178 @ =gUnknown_0812B6FC
	ldr r1, _0804617C @ =0x06014900
	movs r2, #0x90
	lsls r2, r2, #1
	bl sub_08011C68
	movs r6, #0
	ldr r7, _08046180 @ =gUnknown_0812A104
	ldr r4, _08046184 @ =gUnknown_084C1430
	movs r3, #0
_080460DE:
	ldr r0, [r4]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	adds r0, #0x28
	adds r0, r0, r2
	str r3, [r0]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _080460DE
	movs r6, #0
	adds r2, r7, #0
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r6, r0
	blt _08046108
	b _08046218
_08046108:
	movs r3, #0
	ldr r0, [r2]
	ldr r0, [r0]
	lsls r5, r6, #0x10
	ldrh r0, [r0, #2]
	cmp r3, r0
	bge _080461FE
_08046116:
	ldr r0, [r2]
	ldr r2, [r0]
	lsls r3, r3, #0x10
	asrs r1, r3, #0xf
	ldr r4, _08046188 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	asrs r1, r5, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r0, _0804618C @ =0x00001432
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #6
	adds r4, r3, #0
	cmp r0, #8
	bhi _080461E8
	lsls r0, r0, #2
	ldr r1, _08046190 @ =_08046194
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08046148: .4byte gUnknown_08499580
_0804614C: .4byte gUnknown_08125530
_08046150: .4byte 0x00008360
_08046154: .4byte 0x06010000
_08046158: .4byte 0x000001D5
_0804615C: .4byte 0x000001E9
_08046160: .4byte 0x0000020F
_08046164: .4byte gUnknown_0809165C
_08046168: .4byte gUnknown_0812B49C
_0804616C: .4byte 0x060146A0
_08046170: .4byte gUnknown_0812B61C
_08046174: .4byte 0x06014820
_08046178: .4byte gUnknown_0812B6FC
_0804617C: .4byte 0x06014900
_08046180: .4byte gUnknown_0812A104
_08046184: .4byte gUnknown_084C1430
_08046188: .4byte 0x0000417A
_0804618C: .4byte 0x00001432
_08046190: .4byte _08046194
_08046194: @ jump table
	.4byte _080461B8 @ case 0
	.4byte _080461E8 @ case 1
	.4byte _080461B8 @ case 2
	.4byte _080461E8 @ case 3
	.4byte _080461B8 @ case 4
	.4byte _080461B8 @ case 5
	.4byte _080461E8 @ case 6
	.4byte _080461E8 @ case 7
	.4byte _080461B8 @ case 8
_080461B8:
	ldr r0, _080462E4 @ =gUnknown_084C1430
	ldr r0, [r0]
	mov r8, r0
	ldr r0, [r7]
	ldr r2, [r0]
	asrs r1, r4, #0xf
	ldr r3, _080462E8 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	asrs r1, r5, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r0, _080462EC @ =0x00001432
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r0, [r2]
	lsrs r0, r0, #5
	lsls r0, r0, #2
	mov r3, r8
	adds r3, #0x28
	adds r3, r3, r0
	ldr r0, [r3]
	adds r0, #1
	str r0, [r3]
_080461E8:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r7, #0
	ldr r1, [r7]
	ldr r1, [r1]
	ldrh r1, [r1, #2]
	cmp r0, r1
	blt _08046116
_080461FE:
	lsls r0, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r7, #0
	ldr r1, [r2]
	ldr r1, [r1]
	ldrh r1, [r1]
	cmp r0, r1
	bge _08046218
	b _08046108
_08046218:
	ldr r2, _080462E4 @ =gUnknown_084C1430
	ldr r1, [r2]
	movs r0, #0
	str r0, [r1, #0x24]
	movs r6, #0
	adds r4, r2, #0
_08046224:
	ldr r3, [r4]
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #2
	adds r0, r3, #0
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, [r3, #0x24]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r3, #0x24]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #4
	ble _08046224
	bl sub_080248E4
	adds r3, r0, #0
	ldr r4, _080462F0 @ =gUnknown_08499578
	ldr r2, [r4]
	movs r6, #0x80
	lsls r6, r6, #8
	str r6, [sp]
	movs r5, #0
	str r5, [sp, #4]
	movs r0, #3
	movs r1, #2
	bl sub_080149C0
	ldr r2, [r4]
	ldr r4, _080462F4 @ =gUnknown_03004080
	ldrh r3, [r4]
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #0x1c
	movs r1, #2
	bl sub_08014B0C
	ldrh r1, [r4]
	movs r0, #0x17
	cmp r1, #9
	bhi _0804627E
	movs r0, #0x18
_0804627E:
	cmp r1, #0x63
	bhi _08046284
	adds r0, #1
_08046284:
	ldr r6, _080462F0 @ =gUnknown_08499578
	ldr r2, [r6]
	ldr r3, _080462F8 @ =0x00000967
	movs r5, #0x80
	lsls r5, r5, #8
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r1, #2
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _080462FC @ =0x0000095D
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #6
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08046300 @ =0x0000095E
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #8
	movs r1, #6
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08046304 @ =0x00000968
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0xf
	movs r1, #6
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08046308 @ =0x0000096E
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x16
	movs r1, #6
	bl sub_08014A5C
	movs r3, #8
	str r3, [sp, #0xc]
	movs r4, #1
	str r4, [sp, #8]
	b _08046588
	.align 2, 0
_080462E4: .4byte gUnknown_084C1430
_080462E8: .4byte 0x0000417A
_080462EC: .4byte 0x00001432
_080462F0: .4byte gUnknown_08499578
_080462F4: .4byte gUnknown_03004080
_080462F8: .4byte 0x00000967
_080462FC: .4byte 0x0000095D
_08046300: .4byte 0x0000095E
_08046304: .4byte 0x00000968
_08046308: .4byte 0x0000096E
_0804630C:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r2, _08046390 @ =gUnknown_08499578
	mov r8, r2
	ldr r2, [r2]
	ldr r3, _08046394 @ =gUnknown_08499598
	ldr r1, [r3]
	ldr r4, [sp, #8]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	adds r1, r0, r1
	adds r1, #0x3a
	ldrb r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #8
	mov sb, r0
	str r0, [sp]
	movs r5, #0
	str r5, [sp, #4]
	movs r0, #6
	mov r1, sl
	bl sub_08014B0C
	mov r1, r8
	ldr r2, [r1]
	ldr r3, _08046394 @ =gUnknown_08499598
	ldr r0, [r3]
	ldr r4, [sp, #0x10]
	adds r0, r4, r0
	adds r0, #0x3b
	ldrb r3, [r0]
	mov r0, sb
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xa
	mov r1, sl
	bl sub_08014B0C
	ldr r1, _08046394 @ =gUnknown_08499598
	ldr r6, [r1]
	adds r7, r4, r6
	ldrh r2, [r7, #0x14]
	str r2, [sp, #0x14]
	cmp r2, #0
	beq _0804639C
	ldr r3, [sp, #8]
	lsls r4, r3, #0x11
	movs r0, #0xc0
	lsls r0, r0, #0xb
	adds r4, r4, r0
	asrs r4, r4, #0x10
	mov r1, r8
	ldr r2, [r1]
	mov r3, sb
	str r3, [sp]
	str r5, [sp, #4]
	movs r0, #1
	adds r1, r4, #0
	ldr r3, _08046398 @ =0x0000095E
	bl sub_08014A5C
	b _080463C2
	.align 2, 0
_08046390: .4byte gUnknown_08499578
_08046394: .4byte gUnknown_08499598
_08046398: .4byte 0x0000095E
_0804639C:
	ldrb r5, [r7, #0x1b]
	cmp r5, #0
	bne _08046418
	ldr r2, [sp, #8]
	lsls r4, r2, #0x11
	movs r3, #0xc0
	lsls r3, r3, #0xb
	adds r4, r4, r3
	asrs r4, r4, #0x10
	mov r0, r8
	ldr r2, [r0]
	mov r1, sb
	str r1, [sp]
	str r5, [sp, #4]
	movs r0, #3
	adds r1, r4, #0
	ldr r3, _08046410 @ =gUnknown_084C3F40
	bl sub_080149C0
_080463C2:
	ldr r0, _08046414 @ =gUnknown_084C1430
	ldr r1, [r0]
	ldr r2, [sp, #8]
	lsls r0, r2, #2
	adds r1, #0x3c
	adds r1, r1, r0
	movs r0, #0xff
	str r0, [r1]
	mov r3, r8
	ldr r2, [r3]
	mov r0, sb
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	mov r1, sl
	ldr r3, _08046410 @ =gUnknown_084C3F40
	bl sub_080149C0
	mov r1, r8
	ldr r2, [r1]
	mov r3, sb
	str r3, [sp]
	str r5, [sp, #4]
	movs r0, #0x14
	adds r1, r4, #0
	ldr r3, _08046410 @ =gUnknown_084C3F40
	bl sub_080149C0
	mov r0, r8
	ldr r2, [r0]
	mov r1, sb
	str r1, [sp]
	str r5, [sp, #4]
	movs r0, #0x1c
	adds r1, r4, #0
	ldr r3, _08046410 @ =gUnknown_084C3F40
	bl sub_080149C0
	b _08046574
	.align 2, 0
_08046410: .4byte gUnknown_084C3F40
_08046414: .4byte gUnknown_084C1430
_08046418:
	ldr r0, _080464BC @ =gUnknown_084C1430
	ldr r2, [r0]
	ldr r3, [sp, #8]
	lsls r1, r3, #2
	adds r4, r2, #0
	adds r4, #0x3c
	adds r4, r4, r1
	adds r0, r2, #0
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, [r2, #0x24]
	bl __udivsi3
	str r0, [r4]
	ldr r3, _080464C0 @ =gUnknown_03003FC0
	ldrb r0, [r3, #0xd]
	cmp r0, #0
	beq _0804645C
	adds r2, r7, #0
	adds r2, #0x2a
	ldr r0, _080464C4 @ =gUnknown_030033EC
	ldrh r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x2a
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080464CC
_0804645C:
	mov r4, r8
	ldr r2, [r4]
	ldrb r3, [r7, #0x11]
	mov r0, sb
	str r0, [sp]
	ldr r1, [sp, #0x14]
	str r1, [sp, #4]
	movs r0, #0xd
	mov r1, sl
	bl sub_08014B0C
	ldr r2, [sp, #8]
	lsls r4, r2, #0x11
	movs r3, #0xc0
	lsls r3, r3, #0xb
	adds r4, r4, r3
	asrs r4, r4, #0x10
	mov r0, r8
	ldr r2, [r0]
	ldr r1, _080464C8 @ =gUnknown_08499598
	ldr r0, [r1]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r3, [r0, #8]
	mov r0, sb
	str r0, [sp]
	ldr r1, [sp, #0x14]
	str r1, [sp, #4]
	movs r0, #0x14
	adds r1, r4, #0
	bl sub_08014B0C
	mov r3, r8
	ldr r2, [r3]
	ldr r1, _080464C8 @ =gUnknown_08499598
	ldr r0, [r1]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r3, [r0]
	mov r0, sb
	str r0, [sp]
	ldr r1, [sp, #0x14]
	str r1, [sp, #4]
	movs r0, #0x1c
	adds r1, r4, #0
	bl sub_08014B0C
	b _08046574
	.align 2, 0
_080464BC: .4byte gUnknown_084C1430
_080464C0: .4byte gUnknown_03003FC0
_080464C4: .4byte gUnknown_030033EC
_080464C8: .4byte gUnknown_08499598
_080464CC:
	adds r1, r3, #0
	adds r1, #0x31
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r1, [r1]
	ldrb r0, [r0]
	adds r6, r0, #0
	orrs r6, r1
	cmp r6, #0
	beq _08046524
	mov r3, r8
	ldr r2, [r3]
	ldrb r3, [r7, #0x11]
	mov r4, sb
	str r4, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	movs r0, #0xd
	mov r1, sl
	bl sub_08014B0C
	ldr r1, [sp, #8]
	lsls r4, r1, #1
	adds r1, r4, #6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	ldr r2, [r3]
	ldr r3, _08046520 @ =gUnknown_08499598
	ldr r0, [r3]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r3, [r0, #8]
	mov r0, sb
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	movs r0, #0x14
	bl sub_08014B0C
	b _08046556
	.align 2, 0
_08046520: .4byte gUnknown_08499598
_08046524:
	mov r1, r8
	ldr r2, [r1]
	ldr r5, _080465D0 @ =gUnknown_084C3F4C
	mov r3, sb
	str r3, [sp]
	str r6, [sp, #4]
	movs r0, #0xd
	mov r1, sl
	adds r3, r5, #0
	bl sub_080149C0
	ldr r0, [sp, #8]
	lsls r4, r0, #1
	adds r1, r4, #6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	ldr r2, [r3]
	mov r0, sb
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0x14
	adds r3, r5, #0
	bl sub_080149C0
_08046556:
	ldr r3, _080465D4 @ =gUnknown_0812A108
	adds r1, r4, #6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080465D8 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x1c
	ldr r3, [r3]
	bl sub_080149C0
_08046574:
	ldr r0, [sp, #0xc]
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
_08046588:
	bl sub_080248F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	bhi _08046598
	b _0804630C
_08046598:
	ldr r1, _080465DC @ =gUnknown_03003FC0
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _080465B2
	adds r2, r1, #0
	adds r2, #0x31
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	beq _080465E4
_080465B2:
	ldr r0, _080465D8 @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r0, _080465E0 @ =gUnknown_08499598
	ldr r0, [r0]
	ldrb r3, [r0, #0x11]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xd
	movs r1, #0x10
	bl sub_08014B0C
	b _080465FA
	.align 2, 0
_080465D0: .4byte gUnknown_084C3F4C
_080465D4: .4byte gUnknown_0812A108
_080465D8: .4byte gUnknown_08499578
_080465DC: .4byte gUnknown_03003FC0
_080465E0: .4byte gUnknown_08499598
_080465E4:
	ldr r0, _08046634 @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r3, _08046638 @ =gUnknown_084C3F4C
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xd
	movs r1, #0x10
	bl sub_080149C0
_080465FA:
	ldr r0, _08046634 @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r3, _0804663C @ =0x00000963
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #0x10
	bl sub_08014A5C
	ldr r0, _08046640 @ =gUnknown_084C1430
	ldr r4, [r0]
	ldr r1, [r4, #0x28]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, [r4, #0x24]
	bl __udivsi3
	str r0, [r4, #0x3c]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046634: .4byte gUnknown_08499578
_08046638: .4byte gUnknown_084C3F4C
_0804663C: .4byte 0x00000963
_08046640: .4byte gUnknown_084C1430

