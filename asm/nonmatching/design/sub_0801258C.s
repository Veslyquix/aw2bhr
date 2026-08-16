	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801258C
sub_0801258C: @ 0x0801258C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r1, _08012764 @ =gUnknown_03002F38
	ldr r0, _08012768 @ =gDispIo
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0801276C @ =gUnknown_03001FCC
	ldr r0, _08012770 @ =gUnknown_030020B4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08012774 @ =gUnknown_03003030
	ldr r0, _08012778 @ =gUnknown_03001FF8
	ldrh r1, [r0]
	ldr r0, _0801277C @ =gUnknown_03001418
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08012780 @ =gUnknown_03002B3C
	ldr r0, _08012784 @ =gUnknown_03002B34
	ldrh r1, [r0]
	ldr r0, _08012788 @ =gUnknown_03002F18
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801278C @ =gUnknown_03003090
	ldr r0, _08012790 @ =gUnknown_030030A0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012794 @ =gUnknown_03001414
	ldr r0, _08012798 @ =gUnknown_03001400
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0801279C @ =gUnknown_03002F10
	ldr r0, _080127A0 @ =gUnknown_0300200C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080127A4 @ =gUnknown_03002518
	ldr r0, _080127A8 @ =gUnknown_03002000
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080127AC @ =gUnknown_03002F14
	ldr r0, _080127B0 @ =gUnknown_030030C4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080127B4 @ =gUnknown_03003044
	ldr r0, _080127B8 @ =gUnknown_030030A4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080127BC @ =gUnknown_03002008
	ldr r0, _080127C0 @ =gUnknown_030030DC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080127C4 @ =gUnknown_03001FD8
	ldr r0, _080127C8 @ =gUnknown_03002B40
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080127CC @ =gUnknown_03002B70
	ldr r0, _080127D0 @ =gUnknown_03002EFC
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080127D4 @ =gUnknown_03002EE8
	ldr r0, _080127D8 @ =gUnknown_03002B4C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080127DC @ =gUnknown_03002F34
	ldr r0, _080127E0 @ =gUnknown_03002B44
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080127E4 @ =gUnknown_030030AC
	ldr r0, _080127E8 @ =gUnknown_03002B68
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080127EC @ =gUnknown_03002EEC
	ldr r0, _080127F0 @ =gUnknown_03002B30
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080127F4 @ =gUnknown_030020A4
	ldr r0, _080127F8 @ =gUnknown_030024E4
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080127FC @ =gUnknown_03003094
	ldr r0, _08012800 @ =gUnknown_030020B8
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r4, _08012804 @ =gUnknown_03002010
	ldr r2, _08012808 @ =gUnknown_03002B6C
	ldrh r1, [r2]
	ldr r3, _0801280C @ =gUnknown_03001FE8
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r4]
	ldr r1, _08012810 @ =gUnknown_03002EF4
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _08012814 @ =gUnknown_03002B58
	ldrh r0, [r3]
	strh r0, [r1]
	ldr r1, _08012818 @ =gUnknown_03003098
	ldr r0, _0801281C @ =gUnknown_030030B4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012820 @ =gUnknown_030030E4
	ldr r0, _08012824 @ =gUnknown_0300251C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012828 @ =gUnknown_03002014
	ldr r0, _0801282C @ =gUnknown_030030E0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012830 @ =gUnknown_030030C0
	ldr r0, _08012834 @ =gUnknown_03002020
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012838 @ =gUnknown_03001FEC
	ldr r0, _0801283C @ =gUnknown_03002B28
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012840 @ =gUnknown_03001FB4
	ldr r0, _08012844 @ =gUnknown_03001FFC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012848 @ =gUnknown_0300140C
	ldr r0, _0801284C @ =gUnknown_03002B48
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012850 @ =gUnknown_03001FC4
	ldr r0, _08012854 @ =gUnknown_03001FC0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012858 @ =gUnknown_03003038
	ldr r0, _0801285C @ =gUnknown_030030D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012860 @ =gUnknown_03001424
	ldr r0, _08012864 @ =gUnknown_0300303C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08012868 @ =gUnknown_03002030
	ldr r2, _0801286C @ =gUnknown_03001FC8
	ldrh r1, [r2]
	ldr r0, _08012870 @ =gUnknown_030024E0
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r3]
	ldr r1, _08012874 @ =gUnknown_03002F40
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _08012878 @ =gUnknown_03002018
	ldr r0, _0801287C @ =gUnknown_03002034
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08012880 @ =gUnknown_03002EDC
	ldr r0, _08012884 @ =gUnknown_03002004
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _08012888 @ =gUnknown_030030B8
	mov sl, r0
	ldr r1, _0801288C @ =gUnknown_030020B0
	mov sb, r1
	ldrh r0, [r1]
	adds r2, r0, #0
	movs r3, #0
	ldr r0, _08012890 @ =gUnknown_0300309C
	mov r8, r0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0
	lsrs r5, r0, #0x10
	lsls r4, r1, #0x10
	adds r1, r5, #0
	orrs r1, r4
	lsls r0, r0, #0x10
	orrs r2, r0
	orrs r3, r1
	ldr r6, _08012894 @ =gUnknown_03002B60
	ldrh r4, [r6]
	adds r0, r4, #0
	adds r1, r0, #0
	movs r0, #0
	orrs r2, r0
	orrs r3, r1
	ldr r5, _08012898 @ =gUnknown_03002028
	ldrh r4, [r5]
	adds r0, r4, #0
	lsls r1, r0, #0x10
	movs r0, #0
	orrs r2, r0
	orrs r3, r1
	mov r1, sl
	str r2, [r1]
	str r3, [r1, #4]
	ldr r2, _0801289C @ =gUnknown_03002024
	mov r3, sb
	ldrh r1, [r3]
	mov r3, r8
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r2, _080128A0 @ =gUnknown_03001FB0
	ldrh r1, [r6]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r1, _080128A4 @ =gUnknown_03002B50
	ldr r0, _080128A8 @ =gUnknown_03001FB8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080128AC @ =gUnknown_03002F28
	ldr r0, _080128B0 @ =gUnknown_030024C4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080128B4 @ =gUnknown_0300201C
	ldr r0, _080128B8 @ =gUnknown_030024CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080128BC @ =gUnknown_03002B64
	ldr r0, _080128C0 @ =gUnknown_03001410
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012764: .4byte gUnknown_03002F38
_08012768: .4byte gDispIo
_0801276C: .4byte gUnknown_03001FCC
_08012770: .4byte gUnknown_030020B4
_08012774: .4byte gUnknown_03003030
_08012778: .4byte gUnknown_03001FF8
_0801277C: .4byte gUnknown_03001418
_08012780: .4byte gUnknown_03002B3C
_08012784: .4byte gUnknown_03002B34
_08012788: .4byte gUnknown_03002F18
_0801278C: .4byte gUnknown_03003090
_08012790: .4byte gUnknown_030030A0
_08012794: .4byte gUnknown_03001414
_08012798: .4byte gUnknown_03001400
_0801279C: .4byte gUnknown_03002F10
_080127A0: .4byte gUnknown_0300200C
_080127A4: .4byte gUnknown_03002518
_080127A8: .4byte gUnknown_03002000
_080127AC: .4byte gUnknown_03002F14
_080127B0: .4byte gUnknown_030030C4
_080127B4: .4byte gUnknown_03003044
_080127B8: .4byte gUnknown_030030A4
_080127BC: .4byte gUnknown_03002008
_080127C0: .4byte gUnknown_030030DC
_080127C4: .4byte gUnknown_03001FD8
_080127C8: .4byte gUnknown_03002B40
_080127CC: .4byte gUnknown_03002B70
_080127D0: .4byte gUnknown_03002EFC
_080127D4: .4byte gUnknown_03002EE8
_080127D8: .4byte gUnknown_03002B4C
_080127DC: .4byte gUnknown_03002F34
_080127E0: .4byte gUnknown_03002B44
_080127E4: .4byte gUnknown_030030AC
_080127E8: .4byte gUnknown_03002B68
_080127EC: .4byte gUnknown_03002EEC
_080127F0: .4byte gUnknown_03002B30
_080127F4: .4byte gUnknown_030020A4
_080127F8: .4byte gUnknown_030024E4
_080127FC: .4byte gUnknown_03003094
_08012800: .4byte gUnknown_030020B8
_08012804: .4byte gUnknown_03002010
_08012808: .4byte gUnknown_03002B6C
_0801280C: .4byte gUnknown_03001FE8
_08012810: .4byte gUnknown_03002EF4
_08012814: .4byte gUnknown_03002B58
_08012818: .4byte gUnknown_03003098
_0801281C: .4byte gUnknown_030030B4
_08012820: .4byte gUnknown_030030E4
_08012824: .4byte gUnknown_0300251C
_08012828: .4byte gUnknown_03002014
_0801282C: .4byte gUnknown_030030E0
_08012830: .4byte gUnknown_030030C0
_08012834: .4byte gUnknown_03002020
_08012838: .4byte gUnknown_03001FEC
_0801283C: .4byte gUnknown_03002B28
_08012840: .4byte gUnknown_03001FB4
_08012844: .4byte gUnknown_03001FFC
_08012848: .4byte gUnknown_0300140C
_0801284C: .4byte gUnknown_03002B48
_08012850: .4byte gUnknown_03001FC4
_08012854: .4byte gUnknown_03001FC0
_08012858: .4byte gUnknown_03003038
_0801285C: .4byte gUnknown_030030D8
_08012860: .4byte gUnknown_03001424
_08012864: .4byte gUnknown_0300303C
_08012868: .4byte gUnknown_03002030
_0801286C: .4byte gUnknown_03001FC8
_08012870: .4byte gUnknown_030024E0
_08012874: .4byte gUnknown_03002F40
_08012878: .4byte gUnknown_03002018
_0801287C: .4byte gUnknown_03002034
_08012880: .4byte gUnknown_03002EDC
_08012884: .4byte gUnknown_03002004
_08012888: .4byte gUnknown_030030B8
_0801288C: .4byte gUnknown_030020B0
_08012890: .4byte gUnknown_0300309C
_08012894: .4byte gUnknown_03002B60
_08012898: .4byte gUnknown_03002028
_0801289C: .4byte gUnknown_03002024
_080128A0: .4byte gUnknown_03001FB0
_080128A4: .4byte gUnknown_03002B50
_080128A8: .4byte gUnknown_03001FB8
_080128AC: .4byte gUnknown_03002F28
_080128B0: .4byte gUnknown_030024C4
_080128B4: .4byte gUnknown_0300201C
_080128B8: .4byte gUnknown_030024CC
_080128BC: .4byte gUnknown_03002B64
_080128C0: .4byte gUnknown_03001410

