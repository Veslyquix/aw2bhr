	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080077EC
sub_080077EC: @ 0x080077EC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08007840 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	adds r0, #0x2e
	strb r1, [r0]
	movs r3, #9
	ldr r0, _08007844 @ =gUnknown_0200B224
	ldr r4, _08007848 @ =gUnknown_084887AC
	adds r2, r0, #0
	adds r2, #0x24
	lsls r5, r1, #1
_08007804:
	adds r0, r3, #0
	subs r0, #9
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r0, [r1]
	strh r0, [r2, #2]
	adds r2, #4
	adds r3, #1
	cmp r3, #0xd
	ble _08007804
	movs r0, #0x1f
	ands r0, r6
	subs r0, #6
	cmp r0, #8
	bhi _08007886
	lsls r0, r0, #2
	ldr r1, _0800784C @ =_08007850
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08007840: .4byte gUnknown_0200B0B0
_08007844: .4byte gUnknown_0200B224
_08007848: .4byte gUnknown_084887AC
_0800784C: .4byte _08007850
_08007850: @ jump table
	.4byte _08007878 @ case 0
	.4byte _08007886 @ case 1
	.4byte _08007874 @ case 2
	.4byte _08007886 @ case 3
	.4byte _08007880 @ case 4
	.4byte _08007884 @ case 5
	.4byte _08007886 @ case 6
	.4byte _08007886 @ case 7
	.4byte _0800787C @ case 8
_08007874:
	movs r3, #4
	b _08007886
_08007878:
	movs r3, #3
	b _08007886
_0800787C:
	movs r3, #2
	b _08007886
_08007880:
	movs r3, #1
	b _08007886
_08007884:
	movs r3, #0
_08007886:
	ldr r7, _080078C8 @ =gUnknown_0200B0B0
	ldr r6, _080078CC @ =gUnknown_0200B0D0
	ldr r0, _080078D0 @ =gUnknown_0200B224
	movs r5, #4
	adds r4, r0, #0
	adds r4, #0x24
_08007892:
	ldr r2, [r7]
	movs r1, #0x3a
	ldrsh r0, [r2, r1]
	adds r1, r0, r3
	cmp r1, #9
	ble _080078A0
	subs r1, #0xa
_080078A0:
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r4]
	strh r1, [r0, #4]
	adds r3, #1
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08007892
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080078C8: .4byte gUnknown_0200B0B0
_080078CC: .4byte gUnknown_0200B0D0
_080078D0: .4byte gUnknown_0200B224

