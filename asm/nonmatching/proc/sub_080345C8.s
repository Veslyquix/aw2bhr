	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080345C8
sub_080345C8: @ 0x080345C8
	push {r4, lr}
	bl sub_08034F6C
	ldr r4, _080345F0 @ =gUnknown_08090D88
	cmp r0, #0
	bne _080346BC
	ldr r0, _080345F4 @ =gUnknown_030040E4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080346BC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0x14
	bhi _080346BC
	lsls r0, r0, #2
	ldr r1, _080345F8 @ =_080345FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080345F0: .4byte gUnknown_08090D88
_080345F4: .4byte gUnknown_030040E4
_080345F8: .4byte _080345FC
_080345FC: @ jump table
	.4byte _080346BC @ case 0
	.4byte _08034650 @ case 1
	.4byte _08034656 @ case 2
	.4byte _0803465C @ case 3
	.4byte _08034662 @ case 4
	.4byte _08034668 @ case 5
	.4byte _0803466E @ case 6
	.4byte _08034674 @ case 7
	.4byte _0803467A @ case 8
	.4byte _08034680 @ case 9
	.4byte _08034686 @ case 10
	.4byte _0803468C @ case 11
	.4byte _08034692 @ case 12
	.4byte _08034698 @ case 13
	.4byte _0803469E @ case 14
	.4byte _080346BC @ case 15
	.4byte _080346AA @ case 16
	.4byte _080346BC @ case 17
	.4byte _080346B0 @ case 18
	.4byte _080346A4 @ case 19
	.4byte _080346B6 @ case 20
_08034650:
	bl sub_08034938
	b _080346BC
_08034656:
	bl sub_080349E4
	b _080346BC
_0803465C:
	bl sub_08034AF8
	b _080346BC
_08034662:
	bl sub_08034DB0
	b _080346BC
_08034668:
	bl sub_08034DCC
	b _080346BC
_0803466E:
	bl sub_08034DF8
	b _080346BC
_08034674:
	bl sub_08034EA4
	b _080346BC
_0803467A:
	bl sub_08034C90
	b _080346BC
_08034680:
	bl sub_08034CA4
	b _080346BC
_08034686:
	bl sub_08034CB8
	b _080346BC
_0803468C:
	bl sub_08034CD4
	b _080346BC
_08034692:
	bl sub_08034D18
	b _080346BC
_08034698:
	bl sub_0802DC2C
	b _080346BC
_0803469E:
	bl sub_0806171C
	b _080346BC
_080346A4:
	bl sub_08034350
	b _080346BC
_080346AA:
	bl sub_08034ED0
	b _080346BC
_080346B0:
	bl sub_08034EF0
	b _080346BC
_080346B6:
	bl sub_08034F1C
	b _080346EC
_080346BC:
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0xe
	beq _080346CC
	ldr r0, _080346F4 @ =gUnknown_030044DC
	ldrh r0, [r0]
	cmp r0, #0xe
	bne _080346EC
_080346CC:
	ldr r0, _080346F8 @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080346E6
	bl sub_08034F6C
	cmp r0, #0
	bne _080346EC
_080346E6:
	movs r0, #3
	bl sub_0802776C
_080346EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080346F4: .4byte gUnknown_030044DC
_080346F8: .4byte gUnknown_0849A00C

