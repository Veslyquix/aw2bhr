	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043418
sub_08043418: @ 0x08043418
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r4, #0x12
	bls _08043428
	b _0804353C
_08043428:
	lsls r0, r4, #2
	ldr r1, _08043434 @ =_08043438
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08043434: .4byte _08043438
_08043438: @ jump table
	.4byte _08043484 @ case 0
	.4byte _080434D8 @ case 1
	.4byte _080434E4 @ case 2
	.4byte _080434EC @ case 3
	.4byte _0804353C @ case 4
	.4byte _080434F0 @ case 5
	.4byte _080434FC @ case 6
	.4byte _0804350E @ case 7
	.4byte _0804353C @ case 8
	.4byte _0804353C @ case 9
	.4byte _0804353C @ case 10
	.4byte _0804353C @ case 11
	.4byte _08043516 @ case 12
	.4byte _0804351E @ case 13
	.4byte _08043526 @ case 14
	.4byte _0804352A @ case 15
	.4byte _0804352E @ case 16
	.4byte _08043532 @ case 17
	.4byte _08043536 @ case 18
_08043484:
	adds r5, #8
	adds r6, #8
	ldr r0, _080434D0 @ =gUnknown_08499590
	ldr r1, [r0]
	movs r2, #6
	ldrsh r0, [r1, r2]
	adds r0, r6, r0
	asrs r4, r0, #4
	lsls r2, r4, #1
	ldr r3, _080434D4 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r3, #4
	ldrsh r0, [r1, r3]
	adds r0, r5, r0
	asrs r3, r0, #4
	adds r2, r2, r3
	adds r1, #0x12
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _080434C6
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl sub_08042424
	lsls r0, r0, #0x18
	movs r4, #4
	cmp r0, #0
	bne _080434C8
_080434C6:
	movs r4, #0
_080434C8:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	b _08043506
	.align 2, 0
_080434D0: .4byte gUnknown_08499590
_080434D4: .4byte 0x0000417A
_080434D8:
	adds r5, #8
	adds r6, #8
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	b _08043506
_080434E4:
	adds r5, #8
	adds r6, #8
	movs r4, #0x10
	b _0804353C
_080434EC:
	movs r4, #0x11
	b _0804353C
_080434F0:
	adds r5, #8
	adds r6, #8
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #8
	b _08043506
_080434FC:
	adds r5, #8
	adds r6, #8
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0xc
_08043506:
	bl sub_08043574
	adds r4, r0, #0
	b _0804353C
_0804350E:
	adds r5, #8
	adds r6, #8
	movs r4, #0x12
	b _0804353C
_08043516:
	adds r5, #8
	adds r6, #0x10
	movs r4, #0x14
	b _0804353C
_0804351E:
	adds r5, #8
	adds r6, #0x10
	movs r4, #0x13
	b _0804353C
_08043526:
	movs r4, #0x15
	b _0804353C
_0804352A:
	movs r4, #0x16
	b _0804353C
_0804352E:
	movs r4, #0x17
	b _0804353C
_08043532:
	movs r4, #0x18
	b _0804353C
_08043536:
	adds r5, #8
	adds r6, #8
	movs r4, #0x19
_0804353C:
	ldr r0, _08043564 @ =gUnknown_08101EC0
	ldr r1, _08043568 @ =gUnknown_03004008
	ldr r2, [r1]
	ldr r3, _0804356C @ =0x000001FF
	ands r3, r5
	movs r1, #0xff
	ands r1, r6
	str r1, [sp]
	ldr r1, _08043570 @ =0x00001365
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	adds r1, r4, #0
	bl sub_0801C7DC
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043564: .4byte gUnknown_08101EC0
_08043568: .4byte gUnknown_03004008
_0804356C: .4byte 0x000001FF
_08043570: .4byte 0x00001365

