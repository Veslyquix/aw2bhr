	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080694EC
sub_080694EC: @ 0x080694EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	movs r0, #0xbe
	subs r0, r0, r1
	cmp r0, #0x2a
	beq _08069574
	cmp r0, #0x2a
	bgt _08069514
	cmp r0, #0xb
	beq _08069560
	cmp r0, #0xb
	bgt _0806950E
	cmp r0, #2
	beq _0806952E
	b _08069682
_0806950E:
	cmp r0, #0x1e
	beq _0806956E
	b _08069682
_08069514:
	cmp r0, #0x5c
	beq _080695E0
	cmp r0, #0x5c
	bgt _08069522
	cmp r0, #0x2e
	beq _08069598
	b _08069682
_08069522:
	cmp r0, #0x5e
	beq _08069600
	cmp r0, #0x60
	bne _0806952C
	b _08069664
_0806952C:
	b _08069682
_0806952E:
	ldr r2, _08069554 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _08069558 @ =gUnknown_081837A0
	ldr r1, _0806955C @ =0x06008000
	bl sub_08011CAC
	b _08069682
	.align 2, 0
_08069554: .4byte gUnknown_030030CC
_08069558: .4byte gUnknown_081837A0
_0806955C: .4byte 0x06008000
_08069560:
	movs r0, #2
	movs r1, #1
	movs r2, #0x1e
	adds r3, r5, #0
	bl sub_08067BD0
	b _08069682
_0806956E:
	bl sub_08067A24
	b _08069682
_08069574:
	ldr r0, _08069590 @ =gUnknown_030020C0
	ldr r1, _08069594 @ =0x00007FFF
	adds r0, #2
	movs r2, #0xe
_0806957C:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0806957C
	bl sub_080135A4
	bl sub_08067820
	b _08069682
	.align 2, 0
_08069590: .4byte gUnknown_030020C0
_08069594: .4byte 0x00007FFF
_08069598:
	ldr r0, _080695D8 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	movs r0, #2
	movs r1, #0
	movs r2, #0xc
	adds r3, r5, #0
	bl sub_08067D04
	movs r2, #0x90
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	ldr r0, _080695DC @ =0xFFFFC000
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r0, #0xc0
	str r0, [sp, #0xc]
	movs r0, #0xc
	str r0, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r0, #2
	movs r1, #1
	movs r3, #0x80
	bl sub_080679D8
	b _08069682
	.align 2, 0
_080695D8: .4byte gUnknown_0823BDE0
_080695DC: .4byte 0xFFFFC000
_080695E0:
	ldr r0, _080695F8 @ =gUnknown_030020C0
	ldr r1, _080695FC @ =0x00007FFF
	adds r0, #2
	movs r2, #0xe
_080695E8:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080695E8
	bl sub_080135A4
	b _08069682
	.align 2, 0
_080695F8: .4byte gUnknown_030020C0
_080695FC: .4byte 0x00007FFF
_08069600:
	ldr r4, _08069648 @ =gUnknown_03002B6C
	adds r0, r4, #0
	movs r1, #2
	bl sub_08012C48
	ldr r1, _0806964C @ =0x0600D000
	adds r0, r4, #0
	bl sub_08012C1C
	ldr r0, _08069650 @ =gUnknown_08183CA8
	ldr r1, _08069654 @ =0x06004800
	bl sub_08011CAC
	ldr r0, _08069658 @ =gUnknown_08184A74
	ldr r4, _0806965C @ =gUnknown_08499578
	ldr r1, [r4]
	bl sub_08011CAC
	movs r2, #0
	ldr r6, _08069660 @ =0x000003FF
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r0, #0
_0806962E:
	ldr r0, [r4]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r7, [r1]
	adds r0, r3, r7
	strh r0, [r1]
	adds r2, #1
	cmp r2, r6
	ble _0806962E
	bl sub_08013AEC
	b _08069682
	.align 2, 0
_08069648: .4byte gUnknown_03002B6C
_0806964C: .4byte 0x0600D000
_08069650: .4byte gUnknown_08183CA8
_08069654: .4byte 0x06004800
_08069658: .4byte gUnknown_08184A74
_0806965C: .4byte gUnknown_08499578
_08069660: .4byte 0x000003FF
_08069664:
	ldr r0, _08069690 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0x32
	bl sub_08067C7C
	bl sub_08067A24
	adds r0, r5, #0
	bl sub_08067DD4
	bl sub_08067D4C
_08069682:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _08069694
	subs r0, #1
	str r0, [r5, #0x2c]
	b _0806969A
	.align 2, 0
_08069690: .4byte gUnknown_0823BDE0
_08069694:
	adds r0, r5, #0
	bl Proc_Break
_0806969A:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

