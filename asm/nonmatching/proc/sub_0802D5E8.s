	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D5E8
sub_0802D5E8: @ 0x0802D5E8
	push {r4, r5, lr}
	movs r4, #0
	ldr r2, _0802D620 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	ldr r5, _0802D624 @ =0x0000417A
	adds r2, r3, r5
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r1, _0802D628 @ =0x00001432
	adds r3, r3, r1
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #6
	cmp r0, #8
	bhi _0802D65E
	lsls r0, r0, #2
	ldr r1, _0802D62C @ =_0802D630
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D620: .4byte gUnknown_08499590
_0802D624: .4byte 0x0000417A
_0802D628: .4byte 0x00001432
_0802D62C: .4byte _0802D630
_0802D630: @ jump table
	.4byte _0802D654 @ case 0
	.4byte _0802D65E @ case 1
	.4byte _0802D654 @ case 2
	.4byte _0802D65E @ case 3
	.4byte _0802D658 @ case 4
	.4byte _0802D65C @ case 5
	.4byte _0802D65E @ case 6
	.4byte _0802D65E @ case 7
	.4byte _0802D654 @ case 8
_0802D654:
	movs r4, #7
	b _0802D65E
_0802D658:
	movs r4, #0x10
	b _0802D65E
_0802D65C:
	movs r4, #0x20
_0802D65E:
	adds r0, r4, #0
	bl sub_0802D67C
	ldr r0, _0802D678 @ =gUnknown_0849AFE8
	movs r1, #0
	bl sub_080152C0
	bl sub_08034F7C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D678: .4byte gUnknown_0849AFE8

