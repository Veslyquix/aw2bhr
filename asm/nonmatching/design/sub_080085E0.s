	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080085E0
sub_080085E0: @ 0x080085E0
	push {r4, r5, r6, r7, lr}
	ldr r4, _08008630 @ =gUnknown_0808D800
	ldr r0, [r4]
	ldr r3, [r0]
	movs r0, #8
	ldrsh r5, [r3, r0]
	movs r2, #0xa
	ldrsh r6, [r3, r2]
	ldr r0, _08008634 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r7, _08008638 @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800863C @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r3, #0x20]
	ldrh r1, [r3]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r3]
	ldrh r1, [r3, #0x2a]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #1
	cmp r0, #0x12
	bls _08008626
	b _080088EA
_08008626:
	lsls r0, r0, #2
	ldr r1, _08008640 @ =_08008644
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008630: .4byte gUnknown_0808D800
_08008634: .4byte gUnknown_08499590
_08008638: .4byte 0x0000417A
_0800863C: .4byte 0x00000A22
_08008640: .4byte _08008644
_08008644: @ jump table
	.4byte _080088A0 @ case 0
	.4byte _0800872A @ case 1
	.4byte _0800878C @ case 2
	.4byte _080087D6 @ case 3
	.4byte _080086E8 @ case 4
	.4byte _080087FE @ case 5
	.4byte _08008690 @ case 6
	.4byte _080087E0 @ case 7
	.4byte _080088EA @ case 8
	.4byte _080087FE @ case 9
	.4byte _080087FE @ case 10
	.4byte _08008772 @ case 11
	.4byte _080086AA @ case 12
	.4byte _080087FE @ case 13
	.4byte _0800881C @ case 14
	.4byte _0800885E @ case 15
	.4byte _080087FE @ case 16
	.4byte _080088EA @ case 17
	.4byte _080087BE @ case 18
_08008690:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08007CA0
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x6a
	movs r1, #0x8a
	b _080088E8
_080086AA:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800B528
	cmp r0, #0
	blt _080086DE
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C840
	cmp r0, #0
	beq _080086DE
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C608
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F14
_080086DE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800BA9C
	b _080088D8
_080086E8:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C840
	cmp r0, #0
	beq _08008710
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C608
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F14
_08008710:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800F4E0
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x6a
	movs r1, #0x89
	b _080088E8
_0800872A:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C840
	cmp r0, #0
	beq _08008752
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C608
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F14
_08008752:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08009F10
	cmp r0, #0
	bne _08008760
	b _080088EA
_08008760:
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x6a
	movs r1, #0x2d
	b _080088E8
_08008772:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08008F6C
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x6a
	movs r1, #0x89
	b _080088E8
_0800878C:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C840
	cmp r0, #0
	beq _080087B4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C608
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F14
_080087B4:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800AF74
	b _080088D8
_080087BE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800BF78
	cmp r0, #0
	bne _080087CC
	b _080088EA
_080087CC:
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x6a
	movs r1, #0x8a
	b _080088E8
_080087D6:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800CF28
	b _080088D8
_080087E0:
	ldr r4, [r4]
	ldr r0, [r4]
	ldrh r2, [r0, #0x2a]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C454
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	adds r0, #0x6a
	movs r1, #0x88
	b _080088E8
_080087FE:
	ldr r4, [r4]
	ldr r0, [r4]
	ldrh r2, [r0, #0x2a]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C454
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	adds r0, #0x6a
	movs r1, #0x87
	b _080088E8
_0800881C:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C840
	cmp r0, #0
	beq _08008844
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C608
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F14
_08008844:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08010D28
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x6a
	movs r1, #0x87
	b _080088E8
_0800885E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C840
	cmp r0, #0
	beq _08008886
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C608
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F14
_08008886:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08010D80
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x6a
	movs r1, #0x87
	b _080088E8
_080088A0:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C840
	cmp r0, #0
	beq _080088B4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800C608
_080088B4:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F14
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800EC20
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800BEE4
_080088D8:
	adds r0, r5, #0
	adds r1, r6, #0
	bl EnsureValidTile
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x6a
	movs r1, #0x4b
_080088E8:
	strb r1, [r0]
_080088EA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

