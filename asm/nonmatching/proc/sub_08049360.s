	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049360
sub_08049360: @ 0x08049360
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r7, #0
	ldr r1, _080493C0 @ =gUnknown_0812A160
	add r0, sp, #8
	movs r2, #4
	bl sub_0808B6E8
	ldr r1, _080493C4 @ =gUnknown_0812A164
	ldr r4, [r1]
	ldr r0, [r4]
	ldr r2, _080493C8 @ =0x0000083C
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #0
	beq _080493A6
	bl sub_08048F10
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08049394
	b _08049918
_08049394:
	ldr r0, _080493CC @ =gUnknown_084C30E8
	ldr r0, [r0]
	bl sub_080485DC
	ldr r0, [r4]
	ldr r1, _080493D0 @ =0x00000834
	adds r0, r0, r1
	movs r1, #0xb
	strb r1, [r0]
_080493A6:
	ldr r0, [r4]
	ldr r2, _080493D0 @ =0x00000834
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _080493B4
	b _080498F0
_080493B4:
	lsls r0, r0, #2
	ldr r1, _080493D4 @ =_080493D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080493C0: .4byte gUnknown_0812A160
_080493C4: .4byte gUnknown_0812A164
_080493C8: .4byte 0x0000083C
_080493CC: .4byte gUnknown_084C30E8
_080493D0: .4byte 0x00000834
_080493D4: .4byte _080493D8
_080493D8: @ jump table
	.4byte _08049408 @ case 0
	.4byte _080494CC @ case 1
	.4byte _0804950C @ case 2
	.4byte _080495B4 @ case 3
	.4byte _08049640 @ case 4
	.4byte _08049654 @ case 5
	.4byte _08049708 @ case 6
	.4byte _080497EC @ case 7
	.4byte _08049820 @ case 8
	.4byte _08049840 @ case 9
	.4byte _08049868 @ case 10
	.4byte _080498C8 @ case 11
_08049408:
	ldr r4, [r6]
	ldr r0, [r4]
	ldr r5, _08049444 @ =0x00000836
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804941A
	bl sub_08048F4C
_0804941A:
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049428
	b _080498F0
_08049428:
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804944C
	ldr r2, _08049448 @ =gUnknown_0812A168
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _08049470
	b _0804946E
	.align 2, 0
_08049444: .4byte 0x00000836
_08049448: .4byte gUnknown_0812A168
_0804944C:
	ldr r2, _08049490 @ =gUnknown_0812A168
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #2
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _08049462
	bl sub_080485F8
_08049462:
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804946E
	b _080498F0
_0804946E:
	movs r7, #1
_08049470:
	cmp r7, #1
	bne _0804949C
	ldr r2, _08049494 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r1, _08049498 @ =0x00000834
	adds r0, r0, r1
	movs r1, #0xa
	strb r1, [r0]
	b _080498F0
	.align 2, 0
_08049490: .4byte gUnknown_0812A168
_08049494: .4byte gDispIo
_08049498: .4byte 0x00000834
_0804949C:
	ldr r0, [r6]
	ldr r2, [r0]
	ldr r1, _080494C4 @ =0x00000836
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080494AC
	b _08049918
_080494AC:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080494BC
	b _080498F0
_080494BC:
	ldr r0, _080494C8 @ =0x00000834
	adds r1, r2, r0
	b _08049622
	.align 2, 0
_080494C4: .4byte 0x00000836
_080494C8: .4byte 0x00000834
_080494CC:
	bl sub_08048F10
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080494D8
	b _080498F0
_080494D8:
	ldr r2, _08049500 @ =gUnknown_0849EDB0
	ldr r1, _08049504 @ =gUnknown_02028E1C
	ldr r4, [r6]
	ldr r0, [r4]
	ldrh r0, [r0, #0x1e]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_080485DC
	ldr r1, [r4]
	ldr r2, _08049508 @ =0x00000834
	adds r1, r1, r2
	b _08049622
	.align 2, 0
_08049500: .4byte gUnknown_0849EDB0
_08049504: .4byte gUnknown_02028E1C
_08049508: .4byte 0x00000834
_0804950C:
	ldr r0, _08049520 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08049524
	bl sub_080485F8
	b _08049808
	.align 2, 0
_08049520: .4byte gpKeySt
_08049524:
	bl sub_08019260
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08049532
	b _080498F0
_08049532:
	ldr r4, [r6]
	ldr r0, [r4]
	ldr r2, _08049554 @ =0x0000083B
	adds r0, r0, r2
	strb r1, [r0]
	ldr r0, _08049558 @ =gUnknown_03002EE4
	ldrh r0, [r0]
	cmp r0, #1
	bne _08049564
	ldr r0, _0804955C @ =gUnknown_084C3028
	bl sub_080485DC
	ldr r0, [r4]
	ldr r1, _08049560 @ =0x00000834
	adds r0, r0, r1
	b _0804958E
	.align 2, 0
_08049554: .4byte 0x0000083B
_08049558: .4byte gUnknown_03002EE4
_0804955C: .4byte gUnknown_084C3028
_08049560: .4byte 0x00000834
_08049564:
	ldr r3, [r4]
	ldr r2, _08049594 @ =gUnknown_0849EDB0
	ldr r1, _08049598 @ =gUnknown_02028E1C
	ldrh r0, [r3, #0x1e]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r3, #0x28]
	ldr r0, [r0]
	cmp r1, r0
	bhs _080495A4
	ldr r0, _0804959C @ =gUnknown_084C3008
	bl sub_080485DC
	ldr r0, [r4]
	ldr r2, _080495A0 @ =0x00000834
	adds r0, r0, r2
_0804958E:
	movs r1, #7
	strb r1, [r0]
	b _080498F0
	.align 2, 0
_08049594: .4byte gUnknown_0849EDB0
_08049598: .4byte gUnknown_02028E1C
_0804959C: .4byte gUnknown_084C3008
_080495A0: .4byte 0x00000834
_080495A4:
	ldr r0, _080495B0 @ =gUnknown_084C2FE8
	bl sub_080485DC
	ldr r1, [r4]
	b _0804961E
	.align 2, 0
_080495B0: .4byte gUnknown_084C2FE8
_080495B4:
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080495C0
	b _080498F0
_080495C0:
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r1, _0804962C @ =0x0000083B
	adds r0, r0, r1
	movs r1, #0x2d
	strb r1, [r0]
	ldr r3, [r5]
	ldr r2, _08049630 @ =gUnknown_0849EDB0
	ldr r4, _08049634 @ =gUnknown_02028E1C
	ldrh r0, [r3, #0x1e]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r3, #0x28]
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r3, #0x2c]
	ldrh r0, [r3, #0x1e]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_0803C864
	ldr r0, [r5]
	ldrh r3, [r0, #0x1e]
	ldrh r1, [r0, #0x20]
	subs r1, r3, r1
	lsls r1, r1, #0x19
	movs r2, #0xe0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	ldr r0, _08049638 @ =gUnknown_08499578
	ldr r2, [r0]
	adds r3, r3, r4
	ldrb r3, [r3]
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	bl sub_080487B4
	bl sub_08013AEC
	ldr r1, [r5]
_0804961E:
	ldr r0, _0804963C @ =0x00000834
	adds r1, r1, r0
_08049622:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080498F0
	.align 2, 0
_0804962C: .4byte 0x0000083B
_08049630: .4byte gUnknown_0849EDB0
_08049634: .4byte gUnknown_02028E1C
_08049638: .4byte gUnknown_08499578
_0804963C: .4byte 0x00000834
_08049640:
	movs r0, #0x6b
	bl sub_0803B4DC
	ldr r0, [r6]
	ldr r1, [r0]
	ldr r2, _080496EC @ =0x00000834
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08049654:
	ldr r0, _080496F0 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	bne _08049664
	b _080498F0
_08049664:
	ldr r5, [r6]
	ldr r3, [r5]
	ldr r2, _080496F4 @ =gUnknown_0849EDB0
	ldr r7, _080496F8 @ =gUnknown_02028E1C
	ldrh r0, [r3, #0x1e]
	adds r0, r0, r7
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _080496FC @ =0x000003E7
	movs r4, #0
	cmp r1, r0
	bls _08049688
	movs r4, #2
_08049688:
	mov r0, sp
	adds r0, r0, r4
	adds r0, #8
	ldrh r1, [r0]
	ldr r0, [r3, #0x28]
	subs r0, r0, r1
	str r0, [r3, #0x28]
	ldr r1, [r3, #0x2c]
	cmp r0, r1
	bge _080496DA
	str r1, [r3, #0x28]
	ldrh r0, [r3, #0x1e]
	adds r0, r0, r7
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_08017704
	ldr r0, _08049700 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #7
	movs r2, #0xf
	movs r3, #0x17
	bl sub_08012BC8
	movs r0, #0x6c
	bl sub_0803B4DC
	ldr r1, [r5]
	ldr r2, _080496EC @ =0x00000834
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080496DA:
	ldr r0, [r5]
	ldr r1, _08049704 @ =0x00000835
	adds r0, r0, r1
	mov r2, r8
	strb r2, [r0]
	bl sub_08013AEC
	b _080498F0
	.align 2, 0
_080496EC: .4byte 0x00000834
_080496F0: .4byte gUnknown_03004008
_080496F4: .4byte gUnknown_0849EDB0
_080496F8: .4byte gUnknown_02028E1C
_080496FC: .4byte 0x000003E7
_08049700: .4byte gUnknown_08499578
_08049704: .4byte 0x00000835
_08049708:
	bl sub_08048EC4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08049714
	b _080498F0
_08049714:
	ldr r1, [r6]
	ldr r0, [r1]
	ldr r2, _08049728 @ =0x0000083B
	adds r3, r0, r2
	ldrb r2, [r3]
	cmp r2, #0
	beq _0804972C
	subs r0, r2, #1
	strb r0, [r3]
	b _080498F0
	.align 2, 0
_08049728: .4byte 0x0000083B
_0804972C:
	ldrh r3, [r0, #0x1e]
	ldr r5, _080497AC @ =0x00000836
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080497C8
	adds r4, r1, #0
_0804973A:
	ldr r1, _080497B0 @ =gUnknown_02028E1C
	adds r2, r3, r1
	adds r3, #1
	adds r1, r3, r1
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080497B8
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	ldr r2, [r4]
	ldrh r0, [r2, #0x20]
	cmp r0, #0
	beq _0804977A
	adds r3, r2, r5
	ldrb r0, [r3]
	ldrh r1, [r2, #0x20]
	subs r0, r0, r1
	cmp r0, #2
	bgt _0804977A
	subs r0, r1, #1
	strh r0, [r2, #0x20]
	ldrh r0, [r2, #0x1e]
	ldrb r3, [r3]
	cmp r0, r3
	beq _08049788
	subs r0, #1
	strh r0, [r2, #0x1e]
_0804977A:
	ldr r0, [r4]
	ldr r2, _080497AC @ =0x00000836
	adds r1, r0, r2
	ldrh r0, [r0, #0x1e]
	ldrb r1, [r1]
	cmp r0, r1
	blo _08049790
_08049788:
	ldr r1, [r4]
	ldrh r0, [r1, #0x1e]
	subs r0, #1
	strh r0, [r1, #0x1e]
_08049790:
	ldr r0, [r4]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	bl sub_080488E0
	ldr r1, [r4]
	ldr r0, _080497B4 @ =0x00000834
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080497C8
	.align 2, 0
_080497AC: .4byte 0x00000836
_080497B0: .4byte gUnknown_02028E1C
_080497B4: .4byte 0x00000834
_080497B8:
	lsls r0, r3, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [r4]
	ldr r5, _080497E4 @ =0x00000836
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r3, r0
	blo _0804973A
_080497C8:
	ldr r0, [r6]
	ldr r1, [r0]
	ldr r2, _080497E4 @ =0x00000836
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080497D8
	b _080498FE
_080497D8:
	ldr r0, _080497E8 @ =0x00000834
	adds r1, r1, r0
	movs r0, #9
	strb r0, [r1]
	b _080498F0
	.align 2, 0
_080497E4: .4byte 0x00000836
_080497E8: .4byte 0x00000834
_080497EC:
	ldr r0, _08049818 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080497FE
	bl sub_080485F8
_080497FE:
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080498F0
_08049808:
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r1, _0804981C @ =0x00000834
	adds r0, r0, r1
	movs r1, #8
	strb r1, [r0]
	b _080498F0
	.align 2, 0
_08049818: .4byte gpKeySt
_0804981C: .4byte 0x00000834
_08049820:
	bl sub_08048EC4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080498F0
	bl sub_0804931C
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r2, _0804983C @ =0x00000834
	adds r0, r0, r2
	strb r4, [r0]
	b _080498F0
	.align 2, 0
_0804983C: .4byte 0x00000834
_08049840:
	bl sub_08048F10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080498F0
	ldr r0, _08049860 @ =gUnknown_084C3048
	bl sub_080485DC
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r1, _08049864 @ =0x00000834
	adds r0, r0, r1
	strb r4, [r0]
	b _080498F0
	.align 2, 0
_08049860: .4byte gUnknown_084C3048
_08049864: .4byte 0x00000834
_08049868:
	ldr r4, [r6]
	ldr r0, [r4]
	ldr r2, _080498B4 @ =0x00000836
	adds r1, r0, r2
	adds r2, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080498A8
	bl sub_08048F10
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080498F0
	ldr r2, [r4]
	ldr r0, _080498B8 @ =gUnknown_03004008
	ldr r1, [r0]
	movs r0, #3
	ands r1, r0
	ldr r3, _080498BC @ =0x0000083A
	adds r2, r2, r3
	strb r1, [r2]
	ldr r1, _080498C0 @ =gUnknown_084C30E8
	ldr r0, [r4]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080485DC
_080498A8:
	ldr r0, [r4]
	ldr r1, _080498C4 @ =0x00000834
	adds r0, r0, r1
	movs r1, #0xb
	strb r1, [r0]
	b _080498F0
	.align 2, 0
_080498B4: .4byte 0x00000836
_080498B8: .4byte gUnknown_03004008
_080498BC: .4byte 0x0000083A
_080498C0: .4byte gUnknown_084C30E8
_080498C4: .4byte 0x00000834
_080498C8:
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r2, _080498E8 @ =0x00000838
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080498DE
	ldr r0, _080498EC @ =gUnknown_084C3118
	movs r1, #0
	bl sub_080152C0
_080498DE:
	adds r0, r5, #0
	bl Proc_Break
	b _08049918
	.align 2, 0
_080498E8: .4byte 0x00000838
_080498EC: .4byte gUnknown_084C3118
_080498F0:
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r1, _08049924 @ =0x00000836
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049918
_080498FE:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #0x1e]
	ldrh r0, [r0, #0x20]
	subs r1, r1, r0
	lsls r1, r1, #0x14
	movs r2, #0xe4
	lsls r2, r2, #0xe
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r0, #2
	bl sub_08048644
_08049918:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049924: .4byte 0x00000836

