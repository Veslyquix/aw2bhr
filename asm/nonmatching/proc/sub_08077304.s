	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077304
sub_08077304: @ 0x08077304
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r0, _08077398 @ =gUnknown_0300064C
	movs r1, #0
	mov sb, r1
	str r1, [r0]
	movs r0, #0xa0
	bl sub_08063980
	ldr r0, _0807739C @ =sub_080771F0
	bl sub_080638D0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	ldr r4, _080773A0 @ =gUnknown_08615194
	ldr r5, _080773A4 @ =gUnknown_081CC5A0
	ldr r2, [r5]
	mov r8, r2
	ldr r0, [r2, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r0, r1, r4
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [r7, #0x34]
	ldr r3, _080773A8 @ =gUnknown_085C77A0
	movs r0, #0x5c
	muls r0, r2, r0
	adds r2, r0, r3
	ldrb r0, [r2, #0x18]
	str r0, [r7, #0x2c]
	adds r0, r4, #0
	adds r0, #0x10
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r7, #0x30]
	adds r6, r4, #0
	adds r6, #0x20
	adds r1, r1, r6
	ldr r0, [r1]
	cmp r0, #0
	bne _080773B4
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r2, [r0]
	ldr r4, _080773AC @ =gUnknown_081CC5A4
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _080773B0 @ =0x060008C0
	adds r1, r1, r0
	adds r0, r2, #0
	movs r2, #1
	bl sub_08043E3C
	movs r0, #1
	str r0, [r7, #0x3c]
	b _080773E8
	.align 2, 0
_08077398: .4byte gUnknown_0300064C
_0807739C: .4byte sub_080771F0
_080773A0: .4byte gUnknown_08615194
_080773A4: .4byte gUnknown_081CC5A0
_080773A8: .4byte gUnknown_085C77A0
_080773AC: .4byte gUnknown_081CC5A4
_080773B0: .4byte 0x060008C0
_080773B4:
	ldr r0, _08077544 @ =gUnknown_081D1F74
	ldr r4, _08077548 @ =gUnknown_081CC5A4
	ldr r1, [r4]
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _0807754C @ =0x060008C0
	adds r1, r1, r2
	bl Decompress
	ldr r0, _08077550 @ =gUnknown_081D208C
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	mov r0, r8
	ldr r1, [r0, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r7, #0x38]
	mov r1, sb
	str r1, [r7, #0x3c]
_080773E8:
	movs r5, #0
	ldr r0, [r7, #0x2c]
	add r2, sp, #4
	mov r8, r2
	add r3, sp, #8
	mov sl, r3
	ldr r1, _08077554 @ =gUnknown_081CC5A8
	mov sb, r1
	mov r2, sp
	adds r2, #0xc
	str r2, [sp, #0x10]
	cmp r5, r0
	bge _08077432
	ldr r6, _08077558 @ =gUnknown_085C77A0
	adds r4, r6, #0
	adds r4, #0x3c
_08077408:
	ldr r1, [r7, #0x34]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r1, r5, r0
	adds r0, r6, #0
	adds r0, #0x40
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #5
	bne _0807742A
	adds r0, r1, r4
	ldrb r2, [r0]
	adds r0, r2, #0
	ldr r1, _0807755C @ =0x06011300
	movs r2, #0x12
	bl sub_08043FA8
_0807742A:
	adds r5, #1
	ldr r0, [r7, #0x2c]
	cmp r5, r0
	blt _08077408
_08077432:
	ldr r0, _08077560 @ =gUnknown_081D35A8
	ldr r1, _08077564 @ =0x06012000
	bl Decompress
	ldr r0, _08077568 @ =gUnknown_081D2264
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807756C @ =gUnknown_081D20EC
	ldr r3, _08077570 @ =gUnknown_03002B6C
	ldr r1, [r3]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08077574 @ =0x06000520
	adds r1, r1, r2
	bl Decompress
	movs r4, #0
	str r4, [sp]
	ldr r0, _08077578 @ =gUnknown_08551A00
	ldr r1, [r0]
	ldr r5, _0807757C @ =0x01000070
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	ldr r0, _08077580 @ =gUnknown_08551A04
	ldr r1, [r0]
	mov r0, r8
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	mov r0, sb
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r5, _08077584 @ =0x01000200
	mov r0, sl
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0xc]
	ldr r0, _08077588 @ =gUnknown_08499580
	ldr r1, [r0]
	ldr r0, [sp, #0x10]
	adds r2, r5, #0
	bl CpuFastSet
	ldr r4, _0807758C @ =gUnknown_0200C2D0
	bl sub_0803866C
	lsls r0, r0, #2
	ldr r5, _08077590 @ =gUnknown_0202FDFC
	ldr r1, [r5, #0xc]
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	beq _0807752C
	bl sub_0803866C
	lsls r0, r0, #2
	ldr r1, [r5, #0xc]
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	lsrs r0, r0, #4
	bl sub_08037D80
	movs r1, #6
	subs r4, r1, r0
	cmp r4, #0
	beq _0807752C
	bl sub_0801F114
	ldr r2, _08077570 @ =gUnknown_03002B6C
	ldr r1, [r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r0, #4
	movs r2, #0x6a
	movs r3, #2
	bl sub_0801F150
	ldr r5, _08077594 @ =gUnknown_081CC5AC
	ldr r0, [r5]
	lsls r4, r4, #1
	adds r0, r4, r0
	ldrh r0, [r0]
	bl sub_0801F234
	ldr r0, [r6]
	movs r3, #3
	movs r2, #0x2c
	ldr r1, _08077598 @ =0x0000053A
	adds r0, r0, r1
_0807750A:
	strh r2, [r0]
	subs r2, #1
	subs r0, #2
	subs r3, #1
	cmp r3, #0
	bge _0807750A
	ldr r0, [r5]
	adds r0, r4, r0
	ldrh r0, [r0]
	mov r2, sb
	ldr r1, [r2]
	ldr r1, [r1]
	movs r3, #0xaf
	lsls r3, r3, #3
	adds r1, r1, r3
	bl sub_0801F2AC
_0807752C:
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	beq _0807759C
	ldr r0, _08077578 @ =gUnknown_08551A00
	ldr r0, [r0]
	adds r0, #2
	movs r1, #0x46
	movs r2, #1
	bl sub_08077140
	b _080775AA
	.align 2, 0
_08077544: .4byte gUnknown_081D1F74
_08077548: .4byte gUnknown_081CC5A4
_0807754C: .4byte 0x060008C0
_08077550: .4byte gUnknown_081D208C
_08077554: .4byte gUnknown_081CC5A8
_08077558: .4byte gUnknown_085C77A0
_0807755C: .4byte 0x06011300
_08077560: .4byte gUnknown_081D35A8
_08077564: .4byte 0x06012000
_08077568: .4byte gUnknown_081D2264
_0807756C: .4byte gUnknown_081D20EC
_08077570: .4byte gUnknown_03002B6C
_08077574: .4byte 0x06000520
_08077578: .4byte gUnknown_08551A00
_0807757C: .4byte 0x01000070
_08077580: .4byte gUnknown_08551A04
_08077584: .4byte 0x01000200
_08077588: .4byte gUnknown_08499580
_0807758C: .4byte gUnknown_0200C2D0
_08077590: .4byte gUnknown_0202FDFC
_08077594: .4byte gUnknown_081CC5AC
_08077598: .4byte 0x0000053A
_0807759C:
	ldr r0, _0807760C @ =gUnknown_08551A00
	ldr r0, [r0]
	adds r0, #0x82
	movs r1, #0x46
	movs r2, #1
	bl sub_08077180
_080775AA:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	movs r2, #3
	movs r1, #0x31
	movs r3, #0xa1
	lsls r3, r3, #3
	adds r0, r0, r3
_080775BA:
	strh r1, [r0]
	subs r1, #1
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080775BA
	movs r6, #0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	movs r5, #0xa0
	lsls r5, r5, #3
	adds r0, r0, r5
	bl sub_080772B8
	ldr r0, _08077610 @ =gUnknown_08551A04
	ldr r0, [r0]
	adds r0, #0x40
	ldr r1, _08077614 @ =gUnknown_081D2330
	movs r4, #0xd8
	lsls r4, r4, #2
	adds r2, r4, #0
	bl sub_080718F8
	ldr r0, _08077618 @ =gUnknown_08499580
	ldr r0, [r0]
	adds r0, r0, r5
	ldr r1, _0807761C @ =gUnknown_081D249C
	adds r2, r4, #0
	bl sub_080718F8
	str r6, [r7, #0x44]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807760C: .4byte gUnknown_08551A00
_08077610: .4byte gUnknown_08551A04
_08077614: .4byte gUnknown_081D2330
_08077618: .4byte gUnknown_08499580
_0807761C: .4byte gUnknown_081D249C

