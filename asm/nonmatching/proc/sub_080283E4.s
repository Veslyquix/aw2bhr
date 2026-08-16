	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080283E4
sub_080283E4: @ 0x080283E4
	push {r4, r5, r6, r7, lr}
	ldr r4, _08028488 @ =gUnknown_03002EE0
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	ldr r5, _0802848C @ =gUnknown_08090B44
	ldr r7, _08028490 @ =gUnknown_08090B48
	cmp r0, #0
	beq _0802841A
	ldr r3, _08028494 @ =gUnknown_08499598
	ldr r0, [r3]
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x39
	ldrb r2, [r2]
	adds r0, #0x57
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, #0x3a
	ldrb r1, [r1]
	adds r0, #0x93
	strb r1, [r0]
	ldr r0, [r7]
	ldrb r0, [r0]
	bl sub_08015C30
_0802841A:
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08028432
	ldr r2, [r5]
	ldrb r1, [r2, #0xd]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2, #0xd]
_08028432:
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #0x30
	ands r0, r1
	ldr r6, _08028498 @ =gUnknown_08090B4C
	cmp r0, #0
	beq _08028458
	ldr r2, [r6]
	ldr r0, [r7]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r2
	ldrh r2, [r1, #0x38]
	movs r0, #1
	subs r0, r0, r2
	strh r0, [r1, #0x38]
_08028458:
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080284A0
	ldr r2, [r5]
	ldr r3, [r6]
	ldr r0, [r7]
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	movs r1, #0x38
	ldrsh r0, [r0, r1]
	adds r2, r2, r0
	adds r2, #0x39
	ldrb r0, [r2]
	cmp r0, #1
	bne _0802849C
	movs r0, #2
	b _0802849E
	.align 2, 0
_08028488: .4byte gUnknown_03002EE0
_0802848C: .4byte gUnknown_08090B44
_08028490: .4byte gUnknown_08090B48
_08028494: .4byte gUnknown_08499598
_08028498: .4byte gUnknown_08090B4C
_0802849C:
	movs r0, #1
_0802849E:
	strb r0, [r2]
_080284A0:
	ldr r0, [r5]
	ldrb r0, [r0, #0xd]
	cmp r0, #1
	bne _080284B8
	ldr r2, _080284B4 @ =gUnknown_08090B04
	movs r0, #8
	movs r1, #0xd
	bl sub_08013428
	b _080284C2
	.align 2, 0
_080284B4: .4byte gUnknown_08090B04
_080284B8:
	ldr r2, _080284D8 @ =gUnknown_08090B14
	movs r0, #8
	movs r1, #0xd
	bl sub_08013428
_080284C2:
	ldr r0, [r5]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _080284E0
	ldr r2, _080284DC @ =gUnknown_08090B28
	movs r0, #0xb
	movs r1, #0xa
	bl sub_08013428
	b _080284EA
	.align 2, 0
_080284D8: .4byte gUnknown_08090B14
_080284DC: .4byte gUnknown_08090B28
_080284E0:
	ldr r2, _08028500 @ =gUnknown_08090B2C
	movs r0, #0xb
	movs r1, #0xa
	bl sub_08013428
_080284EA:
	ldr r0, [r5]
	adds r0, #0x3a
	ldrb r0, [r0]
	cmp r0, #1
	bne _08028508
	ldr r2, _08028504 @ =gUnknown_08090B30
	movs r0, #0x11
	movs r1, #0xa
	bl sub_08013428
	b _08028512
	.align 2, 0
_08028500: .4byte gUnknown_08090B2C
_08028504: .4byte gUnknown_08090B30
_08028508:
	ldr r2, _08028558 @ =gUnknown_08090B2C
	movs r0, #0x11
	movs r1, #0xa
	bl sub_08013428
_08028512:
	ldr r2, _0802855C @ =gUnknown_08090B34
	movs r0, #0xe
	movs r1, #0xa
	bl sub_08013428
	ldr r2, [r6]
	ldr r0, [r7]
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r4, #0x38
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x11
	movs r1, #0xb0
	lsls r1, r1, #0xc
	adds r0, r0, r1
	asrs r0, r0, #0x10
	ldr r2, _08028560 @ =gUnknown_08090B38
	movs r1, #0xb
	bl sub_08013428
	ldr r2, _08028564 @ =gUnknown_08090B3C
	movs r0, #0xc
	movs r1, #6
	bl sub_08013428
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028558: .4byte gUnknown_08090B2C
_0802855C: .4byte gUnknown_08090B34
_08028560: .4byte gUnknown_08090B38
_08028564: .4byte gUnknown_08090B3C

