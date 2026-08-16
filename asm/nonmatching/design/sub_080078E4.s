	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080078E4
sub_080078E4: @ 0x080078E4
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	ldr r2, _08007918 @ =gUnknown_0200B224
	cmp r0, #0
	bne _08007990
	ldr r3, _0800791C @ =gUnknown_08488810
	ldrh r0, [r3]
	cmp r0, #0xff
	beq _080079B2
_080078F8:
	ldrh r1, [r3]
	adds r3, #2
	movs r0, #0xe0
	ands r0, r1
	cmp r0, #0
	beq _0800797C
	movs r0, #0x1f
	ands r1, r0
	subs r0, r1, #6
	cmp r0, #8
	bhi _0800795A
	lsls r0, r0, #2
	ldr r1, _08007920 @ =_08007924
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08007918: .4byte gUnknown_0200B224
_0800791C: .4byte gUnknown_08488810
_08007920: .4byte _08007924
_08007924: @ jump table
	.4byte _0800794C @ case 0
	.4byte _0800795A @ case 1
	.4byte _08007948 @ case 2
	.4byte _0800795A @ case 3
	.4byte _08007954 @ case 4
	.4byte _08007958 @ case 5
	.4byte _0800795A @ case 6
	.4byte _0800795A @ case 7
	.4byte _08007950 @ case 8
_08007948:
	movs r4, #0
	b _0800795A
_0800794C:
	movs r4, #1
	b _0800795A
_08007950:
	movs r4, #2
	b _0800795A
_08007954:
	movs r4, #3
	b _0800795A
_08007958:
	movs r4, #4
_0800795A:
	ldr r1, _08007978 @ =gUnknown_084887AC
	lsls r0, r4, #2
	adds r0, r0, r4
	adds r0, r5, r0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	adds r2, #2
	ldrh r0, [r0, #2]
	strh r0, [r2]
	adds r2, #2
	adds r3, #2
	b _08007988
	.align 2, 0
_08007978: .4byte gUnknown_084887AC
_0800797C:
	strh r1, [r2]
	adds r2, #2
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
_08007988:
	ldrh r0, [r3]
	cmp r0, #0xff
	bne _080078F8
	b _080079B2
_08007990:
	ldr r3, _08007998 @ =gUnknown_08488856
	subs r0, r5, #1
	lsls r5, r0, #6
	b _080079AA
	.align 2, 0
_08007998: .4byte gUnknown_08488856
_0800799C:
	cmp r1, #0x19
	beq _080079A2
	orrs r1, r5
_080079A2:
	strh r1, [r2]
	adds r2, #2
	strh r1, [r2]
	adds r2, #2
_080079AA:
	ldrh r1, [r3]
	adds r3, #2
	cmp r1, #0xff
	bne _0800799C
_080079B2:
	pop {r4, r5}
	pop {r0}
	bx r0

