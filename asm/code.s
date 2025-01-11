	.include "macro.inc"
	.syntax unified

_08000228: .4byte gUnknown_030020C0
_0800022C: .4byte gUnknown_0200B614
_08000230: .4byte gUnknown_0200B5F4

	arm_func_start sub_08000234
sub_08000234: @ 0x08000234
	push {r4, r5, r6, r7}
	mov r7, #0x3e0
_0800023C:
	ldr r0, _08000230 @ =gUnknown_0200B5F4
	add r0, r0, r7, lsr #5
	ldrsb r5, [r0]
	tst r5, r5
	beq _080002F4
	ldr r4, _0800022C @ =gUnknown_0200B614
	lsr r0, r7, #1
	add r0, r0, r0, lsl #1
	add r0, r0, #0x30
	add r4, r4, r0
	mov r6, #0x1e
_08000268:
	sub r4, r4, #3
	ldrb r0, [r4]
	add r0, r0, r5
	strb r0, [r4]
	subs r0, r0, #0x20
	bpl _08000284
	mov r0, #0
_08000284:
	cmp r0, #0x20
	blo _08000290
	mov r0, #0x1f
_08000290:
	ldrb r1, [r4, #1]
	add r1, r1, r5
	strb r1, [r4, #1]
	subs r1, r1, #0x20
	bpl _080002A8
	mov r1, #0
_080002A8:
	cmp r1, #0x20
	blo _080002B4
	mov r1, #0x1f
_080002B4:
	ldrb r2, [r4, #2]
	add r2, r2, r5
	strb r2, [r4, #2]
	subs r2, r2, #0x20
	bpl _080002CC
	mov r2, #0
_080002CC:
	cmp r2, #0x20
	blo _080002D8
	mov r2, #0x1f
_080002D8:
	add r0, r0, r1, lsl #5
	add r0, r0, r2, lsl #10
	ldr r1, _08000228 @ =gUnknown_030020C0
	add r1, r1, r6
	strh r0, [r1, r7]
	subs r6, r6, #2
	bpl _08000268
_080002F4:
	subs r7, r7, #0x20
	bpl _0800023C
	pop {r4, r5, r6, r7}
	bx lr

	arm_func_start sub_08000304
sub_08000304: @ 0x08000304
	lsr r1, r1, #4
	sub r1, r1, #1
	mov r2, #0xa0
_08000310:
	str r2, [r0]
	str r2, [r0, #8]
	str r2, [r0, #0x10]
	str r2, [r0, #0x18]
	str r2, [r0, #0x20]
	str r2, [r0, #0x28]
	str r2, [r0, #0x30]
	str r2, [r0, #0x38]
	str r2, [r0, #0x40]
	str r2, [r0, #0x48]
	str r2, [r0, #0x50]
	str r2, [r0, #0x58]
	str r2, [r0, #0x60]
	str r2, [r0, #0x68]
	str r2, [r0, #0x70]
	str r2, [r0, #0x78]
	add r0, r0, #0x80
	subs r1, r1, #1
	bpl _08000310
	bx lr

	arm_func_start sub_08000360
sub_08000360: @ 0x08000360
	push {r4, r5, r6, r7}
	sub r1, r1, #2
	mov r2, #0
	mov r3, #0
_08000370:
	ldrh r4, [r0]
	add r2, r2, r4
	eor r3, r3, r4
	add r0, r0, #2
	subs r1, r1, #2
	bpl _08000370
	mov r0, #0x10000
	sub r0, r0, #1
	and r2, r2, r0
	lsl r3, r3, #0x10
	mov r0, r2
	add r0, r0, r3
	pop {r4, r5, r6, r7}
	bx lr

	arm_func_start sub_080003A8
sub_080003A8: @ 0x080003A8
	push {r4, r5, r6, r7}
	mov r4, r0
	sub r6, r2, #0
_080003B4:
	sub r5, r1, #0
_080003B8:
	strh r3, [r4]
	add r4, r4, #2
	subs r5, r5, #1
	bpl _080003B8
	add r0, r0, #0x40
	mov r4, r0
	subs r6, r6, #1
	bpl _080003B4
	pop {r4, r5, r6, r7}
	bx lr

	arm_func_start sub_080003E0
sub_080003E0: @ 0x080003E0
	push {r4, r5, r6, r7}
	tst r2, r2
	beq _08000434
	bmi _08000434
	tst r3, r3
	beq _08000434
	bmi _08000434
	mov r4, #0x40
	sub r4, r4, r2, lsl #1
	sub r6, r3, #1
_08000408:
	sub r5, r2, #1
_0800040C:
	ldrh r7, [r0]
	strh r7, [r1]
	add r0, r0, #2
	add r1, r1, #2
	subs r5, r5, #1
	bpl _0800040C
	add r0, r0, r4
	add r1, r1, r4
	subs r6, r6, #1
	bpl _08000408
_08000434:
	pop {r4, r5, r6, r7}
	bx lr

	arm_func_start sub_0800043C
sub_0800043C: @ 0x0800043C
	push {r4, r5, r6, r7}
	ldrb r3, [r1]
	ldrb r4, [r1, #1]
	add r1, r1, #2
	lsl r7, r4, #6
	add r0, r0, r7
	mov r6, r4
_08000458:
	mov r5, r3
_0800045C:
	ldrh r7, [r1]
	add r7, r7, r2
	strh r7, [r0]
	add r0, r0, #2
	add r1, r1, #2
	subs r5, r5, #1
	bpl _0800045C
	sub r0, r0, r3, lsl #1
	sub r0, r0, #0x42
	subs r6, r6, #1
	bpl _08000458
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_08000490: .4byte gUnknown_03002F2C

	arm_func_start sub_08000494
sub_08000494: @ 0x08000494
	push {r4, r5, r6, r7}
	ldr r7, _08000490 @ =gUnknown_03002F2C
_0800049C:
	ldr r5, [r7]
	ldrh r4, [r2]
	tst r4, r4
	beq _08000528
	bmi _08000528
	add r2, r2, #2
	add r6, r5, r4, lsl #3
	str r6, [r7]
	mov r7, #0x10000
	sub r7, r7, #1
	and r0, r0, r7
	and r1, r1, r7
	orr r0, r0, r1, lsl #16
_080004D0:
	ldrh r1, [r2]
	orr r6, r1, r0, lsr #16
	and r6, r6, #0xff00
	add r7, r1, r0, lsr #16
	and r7, r7, #0xff
	orr r6, r6, r7
	strh r6, [r5]
	ldrh r1, [r2, #2]
	orr r6, r1, r0
	and r6, r6, #0xfe00
	add r7, r1, r0
	lsl r7, r7, #0x17
	lsr r7, r7, #0x17
	orr r6, r6, r7
	strh r6, [r5, #2]
	ldrh r1, [r2, #4]
	add r6, r1, r3
	strh r6, [r5, #4]
	add r2, r2, #6
	add r5, r5, #8
	subs r4, r4, #1
	bne _080004D0
_08000528:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_08000530: .4byte gUnknown_0300141C
_08000534:
	.byte 0xF0, 0x00, 0x2D, 0xE9, 0x10, 0x70, 0x1F, 0xE5, 0xD6, 0xFF, 0xFF, 0xEA

	arm_func_start sub_08000540
sub_08000540: @ 0x08000540
	stm r0!, {r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	mov r0, #0
	tst lr, #1
	moveq pc, lr

	arm_func_start sub_08000550
sub_08000550: @ 0x08000550
	bx lr

	arm_func_start sub_08000554
sub_08000554: @ 0x08000554
	ldm r0!, {r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	movs r0, r1
	moveq r0, #1
	tst lr, #1
	moveq pc, lr

	arm_func_start sub_08000568
sub_08000568: @ 0x08000568
	bx lr

	thumb_func_start sub_0800056C
sub_0800056C: @ 0x0800056C
	ldr r1, _08000578 @ =gUnknown_0200B0B0
	ldr r1, [r1]
	strh r0, [r1, #4]
	movs r0, #1
	strb r0, [r1, #6]
	bx lr
	.align 2, 0
_08000578: .4byte gUnknown_0200B0B0

	thumb_func_start sub_0800057C
sub_0800057C: @ 0x0800057C
	push {lr}
	ldr r0, _08000594 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #9
	bhi _080005EC
	lsls r0, r0, #2
	ldr r1, _08000598 @ =_0800059C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08000594: .4byte gUnknown_0200B0B0
_08000598: .4byte _0800059C
_0800059C: @ jump table
	.4byte _080005C4 @ case 0
	.4byte _080005CA @ case 1
	.4byte _080005D0 @ case 2
	.4byte _080005D6 @ case 3
	.4byte _080005EC @ case 4
	.4byte _080005DC @ case 5
	.4byte _080005E2 @ case 6
	.4byte _080005E8 @ case 7
	.4byte _080005EC @ case 8
	.4byte _080005EC @ case 9
_080005C4:
	bl sub_080005FC
	b _080005EC
_080005CA:
	bl sub_0800081C
	b _080005EC
_080005D0:
	bl sub_08005F4C
	b _080005EC
_080005D6:
	bl sub_08004CA0
	b _080005EC
_080005DC:
	bl sub_08000694
	b _080005EC
_080005E2:
	bl sub_08000650
	b _080005EC
_080005E8:
	bl sub_08000664
_080005EC:
	pop {r0}
	bx r0

	thumb_func_start sub_080005F0
sub_080005F0: @ 0x080005F0
	push {lr}
	movs r0, #1
	bl sub_0800056C
	pop {r0}
	bx r0

	thumb_func_start sub_080005FC
sub_080005FC: @ 0x080005FC
	push {lr}
	ldr r2, _08000638 @ =gUnknown_0200B0B0
	ldr r1, [r2]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08000616
	movs r0, #0
	strb r0, [r1, #6]
	ldr r1, [r2]
	strh r0, [r1, #2]
	movs r0, #0x1e
	str r0, [r1, #0xc]
_08000616:
	ldr r1, [r2]
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _08000646
	ldr r0, [r1, #0xc]
	subs r0, #1
	str r0, [r1, #0xc]
	cmp r0, #0
	bne _08000646
	movs r0, #1
	strh r0, [r1, #2]
	bl sub_08004E44
	cmp r0, #0
	bne _08000640
	ldr r0, _0800063C @ =gUnknown_084856FC
	b _08000642
	.align 2, 0
_08000638: .4byte gUnknown_0200B0B0
_0800063C: .4byte gUnknown_084856FC
_08000640:
	ldr r0, _0800064C @ =gUnknown_084857AC
_08000642:
	bl sub_080193B0
_08000646:
	pop {r0}
	bx r0
	.align 2, 0
_0800064C: .4byte gUnknown_084857AC

	thumb_func_start sub_08000650
sub_08000650: @ 0x08000650
	bx lr
	.align 2, 0

	thumb_func_start sub_08000654
sub_08000654: @ 0x08000654
	ldr r0, _08000660 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	movs r0, #1
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_08000660: .4byte gUnknown_0200B0B0

	thumb_func_start sub_08000664
sub_08000664: @ 0x08000664
	push {r4, lr}
	ldr r4, _08000690 @ =gUnknown_0200B0B0
	ldr r2, [r4]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0800067E
	movs r1, #0
	strb r1, [r2, #6]
	ldr r0, [r4]
	strh r1, [r0, #2]
	bl sub_08003640
_0800067E:
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _0800068A
	bl sub_080035C8
_0800068A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000690: .4byte gUnknown_0200B0B0

	thumb_func_start sub_08000694
sub_08000694: @ 0x08000694
	push {r4, r5, lr}
	sub sp, #8
	ldr r1, _080006E8 @ =gUnknown_0808D6DC
	ldr r4, [r1]
	ldr r2, [r4]
	movs r0, #6
	ldrsb r0, [r2, r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _080006C8
	movs r1, #0
	strb r1, [r2, #6]
	ldr r0, [r4]
	strh r1, [r0, #2]
	bl sub_08001D9C
	bl sub_08003948
	ldr r1, [r4]
	movs r0, #2
	str r0, [r1, #0xc]
	bl sub_080039D0
	movs r0, #0x76
	bl sub_0803B4DC
_080006C8:
	ldr r2, [r4]
	ldrh r0, [r2, #2]
	cmp r0, #0x50
	beq _0800077C
	cmp r0, #0x50
	bgt _080006F2
	cmp r0, #0x3c
	beq _08000724
	cmp r0, #0x3c
	bgt _080006EC
	cmp r0, #0
	beq _080006FE
	cmp r0, #0x32
	beq _08000710
	b _08000812
	.align 2, 0
_080006E8: .4byte gUnknown_0808D6DC
_080006EC:
	cmp r0, #0x46
	beq _08000750
	b _08000812
_080006F2:
	cmp r0, #0x5a
	beq _080007B8
	cmp r0, #0x64
	bne _080006FC
	b _08000800
_080006FC:
	b _08000812
_080006FE:
	ldr r0, [r2, #0xc]
	subs r0, #1
	str r0, [r2, #0xc]
	cmp r0, #0
	ble _0800070A
	b _08000812
_0800070A:
	movs r0, #0x32
	strh r0, [r2, #2]
	b _08000812
_08000710:
	ldr r1, _08000740 @ =gUnknown_03001418
	ldr r3, _08000744 @ =0x0000FFD8
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _08000748 @ =gUnknown_03001FF8
	subs r3, #0x14
	adds r0, r3, #0
	strh r0, [r1]
	movs r0, #0x3c
	strh r0, [r2, #2]
_08000724:
	ldr r0, _0800074C @ =gUnknown_03001FFC
	ldrh r0, [r0]
	cmp r0, #5
	ble _08000812
	ldr r0, [r5]
	ldr r1, [r0]
	movs r0, #0x46
	strh r0, [r1, #2]
	movs r0, #0
	movs r1, #0
	bl sub_0803CE28
	b _08000812
	.align 2, 0
_08000740: .4byte gUnknown_03001418
_08000744: .4byte 0x0000FFD8
_08000748: .4byte gUnknown_03001FF8
_0800074C: .4byte gUnknown_03001FFC
_08000750:
	bl sub_08023824
	bl sub_08023518
	movs r0, #8
	bl sub_08023908
	ldr r0, _08000778 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08000812
	ldr r0, [r4]
	movs r1, #0x50
	strh r1, [r0, #2]
	movs r1, #0xa
	str r1, [r0, #0xc]
	b _08000812
	.align 2, 0
_08000778: .4byte gUnknown_03002EE0
_0800077C:
	ldr r0, [r2, #0xc]
	subs r0, #1
	str r0, [r2, #0xc]
	cmp r0, #0
	bge _08000812
	movs r4, #0
	movs r0, #0x5a
	strh r0, [r2, #2]
	bl sub_0803CEAC
	ldr r0, _080007B4 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #0xa
	str r1, [sp]
	str r4, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0xf
	bl sub_08012BC8
	bl sub_08013AEC
	bl sub_080039BC
	movs r0, #0x66
	bl sub_0803B4DC
	b _08000812
	.align 2, 0
_080007B4: .4byte gUnknown_08499578
_080007B8:
	ldr r0, _080007EC @ =gUnknown_03001FFC
	ldrh r0, [r0]
	cmp r0, #0
	bne _08000812
	ldr r1, _080007F0 @ =gUnknown_03002EFC
	movs r0, #0xa0
	strb r0, [r1]
	movs r4, #0
	movs r0, #0x64
	strh r0, [r2, #2]
	ldr r3, _080007F4 @ =gUnknown_03001FE8
	ldrb r2, [r3]
	movs r1, #0x41
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r2, _080007F8 @ =gUnknown_0300251C
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldr r0, _080007FC @ =gUnknown_030030C4
	strb r4, [r0]
	bl sub_08024268
	b _08000812
	.align 2, 0
_080007EC: .4byte gUnknown_03001FFC
_080007F0: .4byte gUnknown_03002EFC
_080007F4: .4byte gUnknown_03001FE8
_080007F8: .4byte gUnknown_0300251C
_080007FC: .4byte gUnknown_030030C4
_08000800:
	movs r0, #0x28
	strh r0, [r2, #2]
	bl sub_08001D8C
	bl sub_08003934
	movs r0, #1
	bl sub_0800056C
_08000812:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800081C
sub_0800081C: @ 0x0800081C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _08000874 @ =gUnknown_0808D6E0
	ldr r5, [r1]
	ldr r3, [r5]
	movs r0, #6
	ldrsb r0, [r3, r0]
	mov r8, r1
	cmp r0, #0
	beq _08000864
	movs r0, #0
	strb r0, [r3, #6]
	ldr r1, [r5]
	strh r0, [r1, #2]
	ldr r2, _08000878 @ =gUnknown_030033E4
	ldrh r0, [r2]
	strh r0, [r1, #8]
	ldrh r0, [r2, #2]
	strh r0, [r1, #0xa]
	bl sub_08002E3C
	bl sub_08002E5C
	bl sub_08002D7C
	bl sub_080059E4
	bl sub_08001D8C
	bl sub_08003934
	bl sub_080088F0
_08000864:
	ldr r1, [r5]
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _0800087C
	movs r0, #1
	strh r0, [r1, #2]
	b _08000BE6
	.align 2, 0
_08000874: .4byte gUnknown_0808D6E0
_08000878: .4byte gUnknown_030033E4
_0800087C:
	adds r1, #0x6a
	movs r0, #0
	strb r0, [r1]
	bl sub_08023824
	bl sub_0800105C
	mov sb, r0
	movs r0, #4
	bl sub_08023908
	ldr r1, _080008C0 @ =gUnknown_0808D6E4
	ldr r3, [r1]
	ldrh r4, [r3]
	ldr r2, [r5]
	movs r5, #8
	ldrsh r0, [r2, r5]
	cmp r4, r0
	bne _080008AC
	ldrh r1, [r3, #2]
	movs r6, #0xa
	ldrsh r0, [r2, r6]
	cmp r1, r0
	beq _080008C8
_080008AC:
	ldr r1, _080008C4 @ =gUnknown_0808D6E8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r7, [r0]
	strh r4, [r2, #8]
	ldrh r0, [r3, #2]
	strh r0, [r2, #0xa]
	mov sl, r1
	b _080008D2
	.align 2, 0
_080008C0: .4byte gUnknown_0808D6E4
_080008C4: .4byte gUnknown_0808D6E8
_080008C8:
	ldr r0, _08000910 @ =gUnknown_0808D6E8
	ldr r1, [r0]
	ldr r1, [r1]
	ldrh r7, [r1, #4]
	mov sl, r0
_080008D2:
	mov r0, r8
	ldr r4, [r0]
	ldr r3, [r4]
	movs r0, #7
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080009AC
	movs r6, #1
	ldrh r0, [r3, #0x2a]
	cmp r0, #0xd
	bne _08000914
	movs r1, #8
	ldrsh r0, [r3, r1]
	movs r2, #0xa
	ldrsh r1, [r3, r2]
	bl sub_0800B528
	cmp r0, #0
	blt _0800097A
	ldr r1, [r4]
	movs r3, #8
	ldrsh r0, [r1, r3]
	movs r5, #0xa
	ldrsh r1, [r1, r5]
	bl sub_0800B61C
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800090E
	b _08000A08
_0800090E:
	b _0800097A
	.align 2, 0
_08000910: .4byte gUnknown_0808D6E8
_08000914:
	cmp r0, #2
	bne _08000926
	movs r1, #8
	ldrsh r0, [r3, r1]
	movs r2, #0xa
	ldrsh r1, [r3, r2]
	bl sub_0800AEAC
	b _08000976
_08000926:
	cmp r0, #0x13
	bne _08000938
	movs r5, #8
	ldrsh r0, [r3, r5]
	movs r2, #0xa
	ldrsh r1, [r3, r2]
	bl sub_0800BC5C
	b _08000976
_08000938:
	cmp r0, #0xc
	bne _08000946
	movs r5, #8
	ldrsh r0, [r3, r5]
	movs r2, #0xa
	ldrsh r1, [r3, r2]
	b _08000972
_08000946:
	cmp r0, #5
	bne _0800098C
	ldr r0, _08000980 @ =gUnknown_08499590
	ldr r1, [r0]
	movs r5, #0xa
	ldrsh r4, [r3, r5]
	lsls r2, r4, #1
	ldr r5, _08000984 @ =0x0000417A
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r5, #8
	ldrsh r2, [r3, r5]
	adds r0, r0, r2
	ldr r3, _08000988 @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _08000A08
	adds r0, r2, #0
	adds r1, r4, #0
_08000972:
	bl sub_08009310
_08000976:
	cmp r0, #0
	bne _08000A08
_0800097A:
	movs r6, #6
	b _08000A08
	.align 2, 0
_08000980: .4byte gUnknown_08499590
_08000984: .4byte 0x0000417A
_08000988: .4byte 0x00001432
_0800098C:
	cmp r0, #0x10
	bne _0800099E
	movs r5, #8
	ldrsh r0, [r3, r5]
	movs r2, #0xa
	ldrsh r1, [r3, r2]
	bl sub_08010DD4
	b _080009A6
_0800099E:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
_080009A6:
	cmp r0, #0
	beq _08000A08
	b _0800097A
_080009AC:
	ldrh r5, [r3, #0x24]
	cmp r5, #0x19
	bne _080009B6
	movs r6, #5
	b _08000A08
_080009B6:
	ldr r0, _08000A38 @ =gUnknown_085D3DD0
	movs r6, #0xaa
	lsls r6, r6, #1
	adds r0, r0, r6
	ldr r4, [r0]
	ldr r0, _08000A3C @ =gUnknown_08499590
	ldr r2, [r0]
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	lsls r0, r0, #1
	ldr r6, _08000A40 @ =0x0000417A
	adds r1, r2, r6
	adds r1, r1, r0
	movs r6, #8
	ldrsh r0, [r3, r6]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _08000A44 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	ldr r3, _08000A48 @ =gUnknown_085D5ABC
	movs r0, #0x3f
	ands r0, r5
	movs r1, #0x5c
	muls r0, r1, r0
	adds r0, r0, r3
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r2, r2, r0
	adds r4, r4, r2
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	movs r6, #6
	cmp r1, r0
	beq _08000A08
	movs r6, #1
_08000A08:
	adds r0, r6, #0
	bl sub_08023274
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08000ACE
	mov r2, r8
	ldr r4, [r2]
	ldr r0, [r4]
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08000A4C
	cmp r6, #6
	beq _08000A8A
	bl sub_080085E0
	bl sub_08021D10
	bl sub_08024268
	b _08000A86
	.align 2, 0
_08000A38: .4byte gUnknown_085D3DD0
_08000A3C: .4byte gUnknown_08499590
_08000A40: .4byte 0x0000417A
_08000A44: .4byte 0x00001432
_08000A48: .4byte gUnknown_085D5ABC
_08000A4C:
	bl sub_08008928
	adds r5, r0, #0
	cmp r5, #1
	bne _08000A74
	ldr r0, [r4]
	adds r0, #0x6a
	movs r1, #0
	strb r1, [r0]
	mov sb, r1
	ldr r2, [r4]
	movs r3, #8
	ldrsh r0, [r2, r3]
	movs r3, #0xa
	ldrsh r1, [r2, r3]
	ldrh r3, [r2, #0x24]
	movs r2, #0x3f
	ands r2, r3
	bl sub_08035850
_08000A74:
	cmp r5, #0
	ble _08000A86
	ldr r2, [r4]
	ldrh r1, [r2]
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r2]
_08000A86:
	cmp r6, #6
	bne _08000B0C
_08000A8A:
	mov r6, sl
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08000AA0
	movs r0, #0x68
	bl sub_0803B4DC
_08000AA0:
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [r2]
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x59
	movs r1, #0xc
	strb r1, [r0]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x58
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x31
	ble _08000B0C
	movs r0, #0
	strb r0, [r1]
	bl sub_08004D10
	b _08000B0C
_08000ACE:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08000AEC
	bl sub_080088F0
	bl sub_08000BF8
	b _08000B0C
_08000AEC:
	mov r2, r8
	ldr r4, [r2]
	ldr r0, [r4]
	adds r0, #0x59
	ldrb r1, [r0]
	subs r2, r1, #1
	strb r2, [r0]
	lsls r1, r1, #0x18
	cmp r1, #0
	bgt _08000B0C
	ldr r0, [r4]
	adds r0, #0x59
	strb r3, [r0]
	ldr r0, [r4]
	adds r0, #0x58
	strb r3, [r0]
_08000B0C:
	bl sub_0802DBF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08000B24
	movs r0, #8
	ands r7, r0
	cmp r7, #0
	beq _08000B24
	movs r0, #5
	bl sub_0800056C
_08000B24:
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x6a
	ldrb r0, [r1]
	cmp r0, #0
	beq _08000B3A
	bl sub_0803B4DC
	b _08000B48
_08000B3A:
	mov r5, sb
	cmp r5, #0
	beq _08000B48
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B4DC
_08000B48:
	mov r6, r8
	ldr r1, [r6]
	ldr r2, [r1]
	ldrb r3, [r2, #0x11]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _08000B6E
	subs r0, r3, #1
	strb r0, [r2, #0x11]
	ldr r2, [r1]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08000B6E
	ldrh r1, [r2]
	ldr r0, _08000B9C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
_08000B6E:
	bl sub_0802DBF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08000BE6
	bl sub_08034F6C
	cmp r0, #0
	bne _08000BE6
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08000BA0
	movs r0, #3
	bl sub_0800056C
	b _08000BE6
	.align 2, 0
_08000B9C: .4byte 0x0000DFFF
_08000BA0:
	ldr r2, _08000BB8 @ =0x00000303
	ands r2, r1
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	bne _08000BBC
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
	strb r3, [r0, #7]
	b _08000BCE
	.align 2, 0
_08000BB8: .4byte 0x00000303
_08000BBC:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r2, r0
	bne _08000BD6
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #7]
_08000BCE:
	movs r0, #2
	bl sub_0800056C
	b _08000BE6
_08000BD6:
	mov r5, r8
	ldr r0, [r5]
	ldr r2, [r0]
	ldr r1, _08000BF4 @ =gUnknown_030033E4
	ldrh r0, [r1]
	strh r0, [r2, #8]
	ldrh r0, [r1, #2]
	strh r0, [r2, #0xa]
_08000BE6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BF4: .4byte gUnknown_030033E4

	thumb_func_start sub_08000BF8
sub_08000BF8: @ 0x08000BF8
	push {r4, r5, lr}
	ldr r5, _08000C38 @ =gUnknown_0200B0B0
	ldr r3, [r5]
	movs r0, #7
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08000C48
	ldr r0, _08000C3C @ =gUnknown_08499590
	ldr r2, [r0]
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	lsls r0, r0, #1
	ldr r4, _08000C40 @ =0x0000417A
	adds r1, r2, r4
	adds r1, r1, r0
	movs r4, #8
	ldrsh r0, [r3, r4]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _08000C44 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r3, #0x2a]
	ldrb r2, [r2]
	cmp r0, r2
	beq _08000C62
	adds r1, r3, #0
	adds r1, #0x65
	movs r0, #1
	strb r0, [r1]
	b _08000C62
	.align 2, 0
_08000C38: .4byte gUnknown_0200B0B0
_08000C3C: .4byte gUnknown_08499590
_08000C40: .4byte 0x0000417A
_08000C44: .4byte 0x00001432
_08000C48:
	ldrh r4, [r3, #0x24]
	movs r2, #8
	ldrsh r0, [r3, r2]
	movs r2, #0xa
	ldrsh r1, [r3, r2]
	bl sub_08008B70
	cmp r4, r0
	beq _08000C62
	ldr r0, [r5]
	adds r0, #0x65
	movs r1, #1
	strb r1, [r0]
_08000C62:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08000C68
sub_08000C68: @ 0x08000C68
	push {r4, lr}
	movs r0, #0x65
	bl sub_0803B4DC
	ldr r0, _08000CA4 @ =gUnknown_0200B0B0
	ldr r3, [r0]
	movs r0, #7
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08000CB4
	ldr r0, _08000CA8 @ =gUnknown_08499590
	ldr r2, [r0]
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	lsls r0, r0, #1
	ldr r4, _08000CAC @ =0x0000417A
	adds r1, r2, r4
	adds r1, r1, r0
	movs r4, #8
	ldrsh r0, [r3, r4]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _08000CB0 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	bl sub_08000CCC
	b _08000CC4
	.align 2, 0
_08000CA4: .4byte gUnknown_0200B0B0
_08000CA8: .4byte gUnknown_08499590
_08000CAC: .4byte 0x0000417A
_08000CB0: .4byte 0x00001432
_08000CB4:
	movs r2, #8
	ldrsh r0, [r3, r2]
	movs r4, #0xa
	ldrsh r1, [r3, r4]
	bl sub_08008B70
	bl sub_08000CCC
_08000CC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08000CCC
sub_08000CCC: @ 0x08000CCC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08000D20 @ =gUnknown_0200B0B0
	ldr r1, [r5]
	movs r0, #7
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08000D28
	adds r0, r4, #0
	bl sub_08001D24
	adds r1, r0, #0
	subs r1, #4
	cmp r1, #0
	bge _08000CEC
	adds r1, #0x11
_08000CEC:
	ldr r0, [r5]
	adds r0, #0x36
	strb r1, [r0]
	ldr r0, [r5]
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_080073F8
	ldr r3, [r5]
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	adds r2, r0, #4
	cmp r2, #9
	ble _08000D0E
	subs r2, r0, #6
_08000D0E:
	ldr r1, _08000D24 @ =gUnknown_0200B0D0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r2, [r0, #4]
	strh r2, [r3, #0x2a]
	b _08000D7E
	.align 2, 0
_08000D20: .4byte gUnknown_0200B0B0
_08000D24: .4byte gUnknown_0200B0D0
_08000D28:
	cmp r4, #0x19
	beq _08000D34
	asrs r0, r4, #6
	adds r0, #1
	adds r1, #0x2f
	strb r0, [r1]
_08000D34:
	adds r0, r4, #0
	bl sub_08001D24
	adds r1, r0, #0
	subs r1, #3
	cmp r1, #0
	bge _08000D44
	adds r1, #0x14
_08000D44:
	ldr r0, [r5]
	adds r0, #0x38
	strb r1, [r0]
	ldr r0, [r5]
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_080073F8
	ldr r3, [r5]
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	adds r2, r0, #3
	cmp r2, #7
	ble _08000D66
	subs r2, r0, #5
_08000D66:
	ldr r1, _08000D90 @ =gUnknown_0200B0D0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r2, [r0, #4]
	movs r1, #0xc0
	ands r1, r4
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x24]
_08000D7E:
	ldr r0, _08000D94 @ =gUnknown_0808D8AC
	ldr r1, _08000D98 @ =0x06014D40
	movs r2, #0x8c
	lsls r2, r2, #3
	bl sub_08011E54
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000D90: .4byte gUnknown_0200B0D0
_08000D94: .4byte gUnknown_0808D8AC
_08000D98: .4byte 0x06014D40

	thumb_func_start sub_08000D9C
sub_08000D9C: @ 0x08000D9C
	ldr r2, _08000DBC @ =gUnknown_0200B0B0
	ldr r1, [r2]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08000DBA
	movs r0, #0x14
	strb r0, [r1, #0x11]
	ldr r2, [r2]
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
_08000DBA:
	bx lr
	.align 2, 0
_08000DBC: .4byte gUnknown_0200B0B0

	thumb_func_start sub_08000DC0
sub_08000DC0: @ 0x08000DC0
	push {lr}
	bl sub_0800057C
	bl sub_08002EC8
	ldr r0, _08000DEC @ =gUnknown_0200B0B0
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _08000DE8
	ldr r0, _08000DF0 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	ldr r1, _08000DF4 @ =gUnknown_030040A0
	movs r0, #0
	str r0, [r1]
_08000DE8:
	pop {r0}
	bx r0
	.align 2, 0
_08000DEC: .4byte gUnknown_0200B0B0
_08000DF0: .4byte gUnknown_03001FBC
_08000DF4: .4byte gUnknown_030040A0

	thumb_func_start sub_08000DF8
sub_08000DF8: @ 0x08000DF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08000E38 @ =gUnknown_030032D8
	movs r0, #0
	strh r0, [r1]
	bl sub_080215D0
	cmp r4, #0
	bne _08000E1E
	ldr r0, _08000E3C @ =gUnknown_08499590
	ldr r0, [r0]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	bl sub_08003B8C
_08000E1E:
	ldr r0, _08000E40 @ =gUnknown_030033E4
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r0, _08000E44 @ =gUnknown_030033E0
	strh r1, [r0]
	strh r1, [r0, #2]
	bl sub_0802BB98
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000E38: .4byte gUnknown_030032D8
_08000E3C: .4byte gUnknown_08499590
_08000E40: .4byte gUnknown_030033E4
_08000E44: .4byte gUnknown_030033E0

	thumb_func_start sub_08000E48
sub_08000E48: @ 0x08000E48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0x1e
	ldrsh r4, [r0, r1]
	ldr r1, _08000FF0 @ =gUnknown_0808D6EC
	ldr r7, [r1]
	ldr r3, _08000FF4 @ =gUnknown_0200B000
	str r3, [r7]
	adds r0, r3, #0
	adds r0, #0x9c
	movs r5, #0
	strb r5, [r0]
	cmp r4, #0
	bne _08000E84
	adds r0, r3, #0
	movs r1, #0xb0
	bl sub_08001124
	ldr r0, _08000FF8 @ =gUnknown_0200B0D0
	movs r1, #0x9a
	lsls r1, r1, #1
	bl sub_08001124
	movs r0, #0
	movs r1, #1
	bl sub_080078E4
_08000E84:
	ldr r0, _08000FFC @ =gUnknown_030040E4
	movs r6, #0
	strh r5, [r0]
	ldr r0, _08001000 @ =gUnknown_030040E8
	strh r5, [r0]
	ldr r0, _08001004 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _08001008 @ =0x00004233
	adds r0, r0, r2
	movs r1, #4
	strb r1, [r0]
	bl sub_08026BAC
	bl sub_08034780
	bl sub_08026924
	ldr r2, _0800100C @ =gUnknown_08499598
	ldr r0, [r2]
	strb r6, [r0, #0x1d]
	ldr r0, [r2]
	adds r0, #0x59
	movs r3, #1
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, #0x95
	movs r1, #3
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xd1
	movs r1, #8
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _08001010 @ =0x0000010D
	adds r1, r0, r2
	movs r0, #6
	strb r0, [r1]
	ldr r0, _08001014 @ =gUnknown_03003FC0
	strb r6, [r0, #4]
	ldr r0, _08001018 @ =gUnknown_030033EC
	strh r5, [r0]
	ldr r0, _0800101C @ =gUnknown_03004080
	strh r3, [r0]
	bl sub_08026768
	adds r0, r4, #0
	bl sub_08000DF8
	bl sub_08025E74
	bl sub_0803DE68
	bl sub_080268F4
	bl sub_080258CC
	bl sub_08023348
	ldr r5, _08001020 @ =gUnknown_0808D6F0
	ldr r3, _08001024 @ =gUnknown_0808D6F4
	mov r8, r3
	ldr r0, _08001028 @ =gUnknown_0808D6F8
	mov sb, r0
	ldr r1, _0800102C @ =gUnknown_0808D6FC
	mov sl, r1
	cmp r4, #0
	bne _08000F62
	ldr r0, [r7]
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	strh r4, [r0, #0x28]
	strb r6, [r0, #0x12]
	movs r2, #0
	adds r4, r7, #0
	movs r3, #0xff
_08000F22:
	ldr r1, [r4]
	adds r1, #0x17
	adds r1, r1, r2
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, #0x1b
	adds r1, r1, r2
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, #1
	cmp r2, #3
	ble _08000F22
	ldr r2, _08001030 @ =gUnknown_0200B0B0
	ldr r0, [r2]
	adds r0, #0x6b
	movs r1, #0xff
	strb r1, [r0]
	ldr r2, [r2]
	adds r1, r2, #0
	adds r1, #0x60
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
	subs r1, #4
	movs r0, #0x91
	lsls r0, r0, #5
	strh r0, [r1]
	movs r0, #1
	strh r0, [r2, #0x3e]
_08000F62:
	bl sub_0803662C
	ldr r0, [r5]
	bl sub_080366D0
	mov r1, r8
	ldr r0, [r1]
	bl sub_080366C4
	mov r2, sb
	ldr r1, [r2]
	movs r0, #0
	str r0, [r1]
	bl sub_0801B780
	bl sub_08002EB4
	movs r0, #7
	movs r1, #4
	bl sub_08022AAC
	ldr r2, _08001030 @ =gUnknown_0200B0B0
	ldr r1, [r2]
	movs r0, #0xff
	strb r0, [r1, #0x10]
	ldr r3, [r2]
	adds r1, r3, #0
	adds r1, #0x4e
	ldr r0, _08001034 @ =0x0000FD80
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb8
	strh r0, [r1]
	subs r1, #6
	movs r0, #0x64
	strh r0, [r1]
	movs r1, #1
	movs r0, #1
	strh r0, [r3, #0x2a]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2f
	strb r1, [r0]
	bl sub_08007328
	movs r0, #0
	bl sub_0800056C
	mov r3, sl
	ldr r0, [r3]
	movs r1, #0
	bl sub_080152C0
	movs r0, #0x28
	bl sub_08000CCC
	bl sub_08003910
	movs r0, #0xd8
	bl sub_0803B524
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000FF0: .4byte gUnknown_0808D6EC
_08000FF4: .4byte gUnknown_0200B000
_08000FF8: .4byte gUnknown_0200B0D0
_08000FFC: .4byte gUnknown_030040E4
_08001000: .4byte gUnknown_030040E8
_08001004: .4byte gUnknown_08499590
_08001008: .4byte 0x00004233
_0800100C: .4byte gUnknown_08499598
_08001010: .4byte 0x0000010D
_08001014: .4byte gUnknown_03003FC0
_08001018: .4byte gUnknown_030033EC
_0800101C: .4byte gUnknown_03004080
_08001020: .4byte gUnknown_0808D6F0
_08001024: .4byte gUnknown_0808D6F4
_08001028: .4byte gUnknown_0808D6F8
_0800102C: .4byte gUnknown_0808D6FC
_08001030: .4byte gUnknown_0200B0B0
_08001034: .4byte 0x0000FD80

	thumb_func_start sub_08001038
sub_08001038: @ 0x08001038
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08001054 @ =gUnknown_030040A0
	movs r0, #1
	str r0, [r1]
	ldr r0, _08001058 @ =gUnknown_084858DC
	movs r1, #0
	bl sub_080152EC
	strh r4, [r0, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001054: .4byte gUnknown_030040A0
_08001058: .4byte gUnknown_084858DC

	thumb_func_start sub_0800105C
sub_0800105C: @ 0x0800105C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r2, _08001080 @ =gUnknown_0808D700
	ldr r0, [r2]
	ldr r7, [r0]
	ldrh r1, [r7, #0x10]
	movs r0, #0xf
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	beq _08001084
	movs r0, #0
	b _08001106
	.align 2, 0
_08001080: .4byte gUnknown_0808D700
_08001084:
	ldr r0, _08001114 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	lsrs r5, r0, #4
	movs r0, #0xf
	ands r5, r0
	ldr r3, _08001118 @ =gUnknown_0808D704
	ldr r1, [r3]
	mov ip, r1
	ldrh r4, [r1]
	ldr r2, _0800111C @ =gUnknown_0808D708
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r6, r0, r1
	movs r0, #0
	ldrsh r1, [r6, r0]
	adds r4, r4, r1
	cmp r4, #0
	blt _080010CA
	ldrh r7, [r7]
	cmp r4, r7
	bge _080010CA
	ldr r0, _08001120 @ =gUnknown_030032C4
	lsls r1, r1, #2
	ldrh r7, [r0]
	adds r1, r1, r7
	strh r1, [r0]
	mov r0, ip
	strh r4, [r0]
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _080010CA
	movs r4, #0x6a
	mov r8, r4
_080010CA:
	ldr r3, [r3]
	ldrh r0, [r3, #2]
	ldr r1, [r2]
	lsls r2, r5, #2
	adds r1, #2
	adds r2, r2, r1
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r4, r0, r1
	cmp r4, #0
	blt _08001104
	mov r7, sb
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r4, r0
	bge _08001104
	ldr r0, _08001120 @ =gUnknown_030032C4
	lsls r1, r1, #2
	ldrh r5, [r0, #2]
	adds r1, r1, r5
	strh r1, [r0, #2]
	strh r4, [r3, #2]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0
	beq _08001104
	movs r0, #0x6a
	mov r8, r0
_08001104:
	mov r0, r8
_08001106:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08001114: .4byte gUnknown_03002EE0
_08001118: .4byte gUnknown_0808D704
_0800111C: .4byte gUnknown_0808D708
_08001120: .4byte gUnknown_030032C4

	thumb_func_start sub_08001124
sub_08001124: @ 0x08001124
	cmp r1, #0
	ble _08001134
	movs r2, #0
_0800112A:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _0800112A
_08001134:
	bx lr
	.align 2, 0

	thumb_func_start sub_08001138
sub_08001138: @ 0x08001138
	cmp r1, #0
	ble _08001146
_0800113C:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _0800113C
_08001146:
	bx lr

	thumb_func_start sub_08001148
sub_08001148: @ 0x08001148
	cmp r1, #0
	ble _08001156
_0800114C:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bgt _0800114C
_08001156:
	bx lr
