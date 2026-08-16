	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080867BC
sub_080867BC: @ 0x080867BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _08086804 @ =gUnknown_081D9424
	add r0, sp, #4
	movs r2, #0x12
	bl sub_0808B6E8
	adds r6, r5, #0
	adds r6, #0x4e
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _08086894
	adds r0, r5, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r7, r0, #0
	cmp r2, #8
	bgt _0808680C
	ldr r4, _08086808 @ =gUnknown_03002F18
	bl sub_08087298
	movs r2, #0
	ldrsh r1, [r7, r2]
	lsls r1, r1, #1
	add r1, sp
	adds r1, #4
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	b _08086866
	.align 2, 0
_08086804: .4byte gUnknown_081D9424
_08086808: .4byte gUnknown_03002F18
_0808680C:
	cmp r2, #0xc
	bne _08086818
	ldr r0, [r5, #0x58]
	bl sub_08086EB0
	b _08086868
_08086818:
	cmp r2, #0x13
	ble _08086868
	cmp r2, #0x14
	bne _08086844
	ldr r4, _0808683C @ =gUnknown_03002F18
	bl sub_08087298
	movs r2, #0
	ldrsh r1, [r6, r2]
	lsls r1, r1, #8
	subs r0, r0, r1
	strh r0, [r4]
	bl sub_08087248
	ldr r1, _08086840 @ =gUnknown_03002B34
	strh r0, [r1]
	b _08086868
	.align 2, 0
_0808683C: .4byte gUnknown_03002F18
_08086840: .4byte gUnknown_03002B34
_08086844:
	cmp r2, #0x1b
	bgt _08086868
	ldr r4, _08086890 @ =gUnknown_03002F18
	bl sub_08087298
	movs r3, #0
	ldrsh r2, [r7, r3]
	movs r1, #0x1c
	subs r1, r1, r2
	lsls r1, r1, #1
	add r1, sp
	adds r1, #4
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	subs r0, r0, r1
_08086866:
	strh r0, [r4]
_08086868:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1c
	beq _08086878
	b _08086A3C
_08086878:
	adds r0, r5, #0
	bl sub_08087104
	bl sub_08087298
	ldr r1, _08086890 @ =gUnknown_03002F18
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
	b _08086A3C
	.align 2, 0
_08086890: .4byte gUnknown_03002F18
_08086894:
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _080868A2
	b _08086A3C
_080868A2:
	subs r0, #6
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r7, r0, #0
	cmp r2, #8
	bgt _080868D0
	ldr r4, _080868CC @ =gUnknown_03002B34
	bl sub_08087248
	movs r2, #0
	ldrsh r1, [r7, r2]
	lsls r1, r1, #1
	add r1, sp
	adds r1, #4
	ldrh r2, [r1]
	ldrh r1, [r6]
	adds r3, r2, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	b _08086928
	.align 2, 0
_080868CC: .4byte gUnknown_03002B34
_080868D0:
	cmp r2, #0xc
	bne _080868DC
	ldr r0, [r5, #0x58]
	bl sub_08086EB0
	b _0808692A
_080868DC:
	cmp r2, #0x13
	ble _0808692A
	cmp r2, #0x14
	bne _08086904
	ldr r4, _080868FC @ =gUnknown_03002B34
	bl sub_08087248
	ldrh r1, [r6]
	lsls r1, r1, #8
	subs r0, r0, r1
	strh r0, [r4]
	bl sub_08087298
	ldr r1, _08086900 @ =gUnknown_03002F18
	strh r0, [r1]
	b _0808692A
	.align 2, 0
_080868FC: .4byte gUnknown_03002B34
_08086900: .4byte gUnknown_03002F18
_08086904:
	cmp r2, #0x1b
	bgt _0808692A
	ldr r4, _0808693C @ =gUnknown_03002B34
	bl sub_08087248
	movs r1, #0
	ldrsh r2, [r7, r1]
	movs r1, #0x1c
	subs r1, r1, r2
	lsls r1, r1, #1
	add r1, sp
	adds r1, #4
	ldrh r2, [r1]
	ldrh r1, [r6]
	adds r3, r2, #0
	muls r3, r1, r3
	adds r1, r3, #0
	subs r0, r0, r1
_08086928:
	strh r0, [r4]
_0808692A:
	ldr r3, [r5, #0x2c]
	cmp r3, #0x10
	bhi _08086A00
	lsls r0, r3, #2
	ldr r1, _08086940 @ =_08086944
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808693C: .4byte gUnknown_03002B34
_08086940: .4byte _08086944
_08086944: @ jump table
	.4byte _08086988 @ case 0
	.4byte _08086988 @ case 1
	.4byte _08086988 @ case 2
	.4byte _08086988 @ case 3
	.4byte _08086988 @ case 4
	.4byte _08086988 @ case 5
	.4byte _08086988 @ case 6
	.4byte _08086988 @ case 7
	.4byte _080869A0 @ case 8
	.4byte _080869A8 @ case 9
	.4byte _080869CC @ case 10
	.4byte _080869D8 @ case 11
	.4byte _080869D8 @ case 12
	.4byte _080869D8 @ case 13
	.4byte _080869D8 @ case 14
	.4byte _080869D8 @ case 15
	.4byte _080869D8 @ case 16
_08086988:
	ldr r4, _0808699C @ =gUnknown_03001FF8
	ldrh r0, [r6]
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #3
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	b _080869F0
	.align 2, 0
_0808699C: .4byte gUnknown_03001FF8
_080869A0:
	movs r0, #0
	bl sub_0801B780
	b _08086A06
_080869A8:
	ldr r2, _080869C4 @ =gUnknown_03001FF8
	ldrh r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	strh r0, [r2]
	ldr r0, [r5, #0x5c]
	ldr r1, _080869C8 @ =gUnknown_03005928
	ldr r1, [r1]
	movs r2, #0
	bl sub_08086BF8
	b _08086A06
	.align 2, 0
_080869C4: .4byte gUnknown_03001FF8
_080869C8: .4byte gUnknown_03005928
_080869CC:
	ldr r0, [r5, #0x5c]
	ldr r1, _080869F8 @ =gUnknown_03005928
	ldr r1, [r1]
	movs r2, #0
	bl sub_08086CE0
_080869D8:
	ldr r4, _080869FC @ =gUnknown_03001FF8
	ldrh r0, [r6]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #3
	rsbs r1, r1, #0
	ldr r3, [r5, #0x2c]
	subs r3, #8
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0
_080869F0:
	bl sub_08074234
	strh r0, [r4]
	b _08086A06
	.align 2, 0
_080869F8: .4byte gUnknown_03005928
_080869FC: .4byte gUnknown_03001FF8
_08086A00:
	ldr r1, _08086A44 @ =gUnknown_03001FF8
	movs r0, #0
	strh r0, [r1]
_08086A06:
	adds r1, r7, #0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r5, #0x2c]
	adds r0, #1
	str r0, [r5, #0x2c]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1c
	bne _08086A2A
	adds r0, r5, #0
	bl sub_08087104
	bl sub_08087248
	ldr r1, _08086A48 @ =gUnknown_03002B34
	strh r0, [r1]
_08086A2A:
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r0, #0x1b
	ble _08086A3C
	ldr r0, [r5, #0x2c]
	cmp r0, #0x11
	ble _08086A3C
	movs r0, #0
	strh r0, [r6]
_08086A3C:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086A44: .4byte gUnknown_03001FF8
_08086A48: .4byte gUnknown_03002B34

