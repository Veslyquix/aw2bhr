	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804236C
sub_0804236C: @ 0x0804236C
	push {r4, r5, r6, lr}
	ldr r2, _080423C8 @ =gUnknown_03003F38
	ldrb r3, [r2]
	ldr r6, _080423CC @ =gUnknown_08499590
	ldr r2, [r6]
	lsls r1, r1, #0x10
	asrs r5, r1, #0xf
	ldr r4, _080423D0 @ =0x0000417A
	adds r1, r2, r4
	adds r1, r1, r5
	ldrh r1, [r1]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r1, r1, r4
	ldr r0, _080423D4 @ =0x00001432
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r1, [r2]
	adds r0, r3, #0
	bl sub_08026FD0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0804241C
	ldr r1, [r6]
	ldr r2, _080423D0 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r4, _080423D4 @ =0x00001432
	adds r1, r1, r4
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #6
	cmp r0, #0xe
	bhi _0804241C
	lsls r0, r0, #2
	ldr r1, _080423D8 @ =_080423DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080423C8: .4byte gUnknown_03003F38
_080423CC: .4byte gUnknown_08499590
_080423D0: .4byte 0x0000417A
_080423D4: .4byte 0x00001432
_080423D8: .4byte _080423DC
_080423DC: @ jump table
	.4byte _08042418 @ case 0
	.4byte _0804241C @ case 1
	.4byte _08042418 @ case 2
	.4byte _0804241C @ case 3
	.4byte _08042418 @ case 4
	.4byte _08042418 @ case 5
	.4byte _0804241C @ case 6
	.4byte _0804241C @ case 7
	.4byte _08042418 @ case 8
	.4byte _0804241C @ case 9
	.4byte _0804241C @ case 10
	.4byte _0804241C @ case 11
	.4byte _0804241C @ case 12
	.4byte _0804241C @ case 13
	.4byte _08042418 @ case 14
_08042418:
	movs r0, #1
	b _0804241E
_0804241C:
	movs r0, #0
_0804241E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

