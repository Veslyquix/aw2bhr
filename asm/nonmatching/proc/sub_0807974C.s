	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807974C
sub_0807974C: @ 0x0807974C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x38]
	movs r1, #3
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _08079B08 @ =gUnknown_0822AC60
	adds r0, r0, r1
	movs r1, #0xae
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
	ldr r0, [r6, #0x38]
	adds r0, #1
	str r0, [r6, #0x38]
	adds r0, r6, #0
	movs r1, #0
	bl sub_080795A8
	ldr r4, _08079B0C @ =gUnknown_08615C20
	movs r0, #0xa6
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x50
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _08079B10 @ =0x00005310
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x60
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _08079B14 @ =0x00005320
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x70
	adds r3, r4, #0
	bl PutSprite
	ldr r3, _08079B18 @ =gUnknown_08615C2E
	ldr r0, _08079B1C @ =0x000052FC
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x80
	bl PutSprite
	ldr r0, _08079B20 @ =0x00005330
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	ldr r5, _08079B24 @ =gUnknown_0848B6C6
	ldr r4, _08079B28 @ =0x000052D0
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x50
	adds r3, r5, #0
	bl PutSprite
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x60
	adds r3, r5, #0
	bl PutSprite
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x70
	adds r3, r5, #0
	bl PutSprite
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x88
	adds r3, r5, #0
	bl PutSprite
	adds r4, r6, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r6, #0x58]
	cmp r1, r0
	bge _0807982A
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_0807982A:
	adds r0, r6, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldr r1, [r6, #0x5c]
	mov r8, r0
	cmp r2, r1
	bge _08079842
	ldrh r0, [r0]
	adds r0, #1
	mov r2, r8
	strh r0, [r2]
_08079842:
	adds r0, r6, #0
	adds r0, #0x68
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldr r1, [r6, #0x60]
	adds r7, r0, #0
	cmp r2, r1
	bge _08079858
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_08079858:
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r1, _08079B2C @ =gUnknown_081D92F4
	mov sl, r1
	cmp r0, #0x63
	ble _0807988E
	movs r1, #0x64
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	mov r2, sl
	ldr r3, [r2]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	movs r2, #0x50
	bl PutSprite
_0807988E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #9
	ble _080798C0
	movs r1, #0xa
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	mov r2, sl
	ldr r3, [r2]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x74
	movs r2, #0x50
	bl PutSprite
_080798C0:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xaa
	lsls r2, r2, #2
	mov sb, r2
	add r0, sb
	movs r4, #0xa0
	lsls r4, r4, #7
	orrs r0, r4
	mov r1, sl
	ldr r5, [r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #0x50
	adds r3, r5, #0
	bl PutSprite
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x63
	ble _0807991A
	movs r1, #0x64
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r0, r0, r2
	orrs r0, r4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	movs r2, #0x60
	adds r3, r5, #0
	bl PutSprite
_0807991A:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #9
	ble _08079944
	movs r1, #0xa
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	add r0, sb
	orrs r0, r4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x74
	movs r2, #0x60
	adds r3, r5, #0
	bl PutSprite
_08079944:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	add r0, sb
	orrs r0, r4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #0x60
	adds r3, r5, #0
	bl PutSprite
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0x63
	ble _0807998C
	movs r1, #0x64
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	add r0, sb
	orrs r0, r4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	movs r2, #0x70
	adds r3, r5, #0
	bl PutSprite
_0807998C:
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #9
	ble _080799B4
	movs r1, #0xa
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	add r0, sb
	orrs r0, r4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x74
	movs r2, #0x70
	adds r3, r5, #0
	bl PutSprite
_080799B4:
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	add r0, sb
	orrs r0, r4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #0x70
	adds r3, r5, #0
	bl PutSprite
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r5, r0, #0
	cmp r1, #0x6b
	ble _08079A9A
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #2
	bl DivRem
	cmp r0, #0
	beq _08079A04
	ldr r2, _08079B30 @ =gUnknown_03002B28
	ldrh r0, [r2]
	cmp r0, #0
	beq _08079A04
	ldr r0, _08079B34 @ =gUnknown_03002020
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
_08079A04:
	adds r4, r6, #0
	adds r4, #0x6a
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x63
	ble _08079A3C
	movs r1, #0x64
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x91
	lsls r2, r2, #3
	mov r1, sl
	ldr r3, [r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	bl PutSpriteExt
_08079A3C:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #9
	ble _08079A70
	movs r1, #0xa
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x91
	lsls r2, r2, #3
	mov r1, sl
	ldr r3, [r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x74
	bl PutSpriteExt
_08079A70:
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x91
	lsls r2, r2, #3
	mov r1, sl
	ldr r3, [r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	bl PutSpriteExt
_08079A9A:
	adds r0, r6, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r6, #0x58]
	cmp r1, r0
	bne _08079ABE
	mov r0, r8
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r6, #0x5c]
	cmp r1, r0
	bne _08079ABE
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r6, #0x60]
	cmp r1, r0
	beq _08079ACE
_08079ABE:
	ldrh r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08079ACE
	movs r0, #0x7c
	bl sub_0803B4DC
_08079ACE:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0xaf
	ble _08079AEE
	ldr r1, _08079B34 @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _08079B30 @ =gUnknown_03002B28
	movs r0, #8
	strh r0, [r1]
	movs r0, #0x79
	bl sub_0803B4DC
	adds r0, r6, #0
	bl Proc_Break
_08079AEE:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08079B04
sub_08079B04: @ 0x08079B04
	b _08079B38
	.align 2, 0
_08079B08: .4byte gUnknown_0822AC60
_08079B0C: .4byte gUnknown_08615C20
_08079B10: .4byte 0x00005310
_08079B14: .4byte 0x00005320
_08079B18: .4byte gUnknown_08615C2E
_08079B1C: .4byte 0x000052FC
_08079B20: .4byte 0x00005330
_08079B24: .4byte gUnknown_0848B6C6
_08079B28: .4byte 0x000052D0
_08079B2C: .4byte gUnknown_081D92F4
_08079B30: .4byte gUnknown_03002B28
_08079B34: .4byte gUnknown_03002020
_08079B38:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	ldrh r0, [r7, #0x38]
	movs r1, #3
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _08079E7C @ =gUnknown_0822AC60
	adds r0, r0, r1
	movs r1, #0xae
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
	ldr r0, [r7, #0x38]
	adds r0, #1
	str r0, [r7, #0x38]
	cmp r5, #0x60
	bhi _08079B80
	movs r2, #0x50
	subs r2, r2, r5
	ldr r3, _08079E80 @ =gUnknown_08615C20
	movs r0, #0xa6
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	bl PutSprite
_08079B80:
	cmp r5, #0x70
	bhi _08079B96
	movs r2, #0x60
	subs r2, r2, r5
	ldr r3, _08079E80 @ =gUnknown_08615C20
	ldr r0, _08079E84 @ =0x00005310
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	bl PutSprite
_08079B96:
	cmp r5, #0x80
	bhi _08079BAC
	movs r2, #0x70
	subs r2, r2, r5
	ldr r3, _08079E80 @ =gUnknown_08615C20
	ldr r0, _08079E88 @ =0x00005320
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	bl PutSprite
_08079BAC:
	cmp r5, #0x90
	bhi _08079BC2
	movs r2, #0x80
	subs r2, r2, r5
	ldr r3, _08079E8C @ =gUnknown_08615C2E
	ldr r0, _08079E90 @ =0x000052FC
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	bl PutSprite
_08079BC2:
	cmp r5, #0x98
	bhi _08079BD8
	movs r2, #0x88
	subs r2, r2, r5
	ldr r3, _08079E80 @ =gUnknown_08615C20
	ldr r0, _08079E94 @ =0x00005330
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	bl PutSprite
_08079BD8:
	movs r4, #0
	movs r0, #0x6a
	adds r0, r0, r7
	mov r8, r0
	movs r6, #0x60
_08079BE2:
	lsls r0, r4, #4
	cmp r5, r6
	bhi _08079BFC
	adds r2, r5, #0
	subs r2, #0x50
	subs r2, r0, r2
	ldr r0, _08079E98 @ =0x000052D0
	str r0, [sp]
	movs r0, #0
	movs r1, #0x90
	ldr r3, _08079E9C @ =gUnknown_0848B6C6
	bl PutSprite
_08079BFC:
	adds r6, #0x10
	adds r4, #1
	cmp r4, #2
	ble _08079BE2
	cmp r5, #0x98
	bhi _08079C1A
	movs r2, #0x88
	subs r2, r2, r5
	ldr r3, _08079E9C @ =gUnknown_0848B6C6
	ldr r0, _08079E98 @ =0x000052D0
	str r0, [sp]
	movs r0, #0
	movs r1, #0x90
	bl PutSprite
_08079C1A:
	ldr r0, [r7, #0x58]
	cmp r0, #0x63
	ble _08079C4E
	cmp r5, #0x60
	bhi _08079C4E
	movs r1, #0x64
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x50
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	bl PutSprite
_08079C4E:
	ldr r0, [r7, #0x58]
	cmp r0, #9
	ble _08079C82
	cmp r5, #0x60
	bhi _08079CAC
	movs r1, #0xa
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x50
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x74
	bl PutSprite
_08079C82:
	cmp r5, #0x60
	bhi _08079CAC
	ldr r0, [r7, #0x58]
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x50
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	bl PutSprite
_08079CAC:
	ldr r0, [r7, #0x5c]
	cmp r0, #0x63
	ble _08079CE0
	cmp r5, #0x70
	bhi _08079CE0
	movs r1, #0x64
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x60
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	bl PutSprite
_08079CE0:
	ldr r0, [r7, #0x5c]
	cmp r0, #9
	ble _08079D14
	cmp r5, #0x70
	bhi _08079D3E
	movs r1, #0xa
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x60
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x74
	bl PutSprite
_08079D14:
	cmp r5, #0x70
	bhi _08079D3E
	ldr r0, [r7, #0x5c]
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x60
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	bl PutSprite
_08079D3E:
	ldr r0, [r7, #0x60]
	cmp r0, #0x63
	ble _08079D72
	cmp r5, #0x80
	bhi _08079D72
	movs r1, #0x64
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x70
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	bl PutSprite
_08079D72:
	ldr r0, [r7, #0x60]
	cmp r0, #9
	ble _08079DA6
	cmp r5, #0x80
	bhi _08079DD0
	movs r1, #0xa
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x70
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x74
	bl PutSprite
_08079DA6:
	cmp r5, #0x80
	bhi _08079DD0
	ldr r0, [r7, #0x60]
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x70
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	bl PutSprite
_08079DD0:
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x63
	ble _08079E08
	cmp r5, #0x98
	bhi _08079E08
	movs r1, #0x64
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x88
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	bl PutSprite
_08079E08:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #9
	ble _08079E40
	cmp r5, #0x98
	bhi _08079E6E
	movs r1, #0xa
	bl Div
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x88
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x74
	bl PutSprite
_08079E40:
	cmp r5, #0x98
	bhi _08079E6E
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	orrs r0, r1
	movs r2, #0x88
	subs r2, r2, r5
	ldr r3, _08079EA0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	bl PutSprite
_08079E6E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079E7C: .4byte gUnknown_0822AC60
_08079E80: .4byte gUnknown_08615C20
_08079E84: .4byte 0x00005310
_08079E88: .4byte 0x00005320
_08079E8C: .4byte gUnknown_08615C2E
_08079E90: .4byte 0x000052FC
_08079E94: .4byte 0x00005330
_08079E98: .4byte 0x000052D0
_08079E9C: .4byte gUnknown_0848B6C6
_08079EA0: .4byte gUnknown_0848B690

	thumb_func_start sub_08079EA4
sub_08079EA4: @ 0x08079EA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0
	bl sub_080795A8
	adds r0, r5, #0
	movs r1, #0
	bl _08079B38
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r5, #0x30]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r2, r0, #0
	str r2, [r5, #0x34]
	ldr r6, _08079FA0 @ =gSinLut
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r8, r0
	movs r4, #0x80
	lsls r4, r4, #2
	movs r1, #2
	cmp r2, r4
	beq _08079EEE
	subs r1, r4, r2
_08079EEE:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	ldrsh r6, [r6, r0]
	rsbs r0, r6, #0
	lsls r0, r0, #4
	ldr r2, [r5, #0x34]
	movs r1, #2
	cmp r2, r4
	beq _08079F0C
	subs r1, r4, r2
_08079F0C:
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r0, r6, #4
	ldr r2, [r5, #0x34]
	movs r1, #2
	cmp r2, r4
	beq _08079F20
	subs r1, r4, r2
_08079F20:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [r5, #0x34]
	movs r1, #2
	cmp r0, r4
	beq _08079F32
	subs r1, r4, r0
_08079F32:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, sb
	adds r2, r7, #0
	adds r3, r6, #0
	bl SetObjAffine
	movs r1, #0xa2
	lsls r1, r1, #2
	ldr r2, [r5, #0x40]
	adds r2, #0x38
	movs r0, #0xe0
	lsls r0, r0, #3
	orrs r2, r0
	ldr r3, _08079FA4 @ =gUnknown_0848B6A0
	ldr r4, _08079FA8 @ =gUnknown_08615E40
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r0, #4
	lsls r0, r0, #0xc
	movs r4, #0x90
	lsls r4, r4, #2
	orrs r0, r4
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	ldr r0, [r5, #0x30]
	cmp r0, #7
	ble _08079F8C
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08079F8C:
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079FA0: .4byte gSinLut
_08079FA4: .4byte gUnknown_0848B6A0
_08079FA8: .4byte gUnknown_08615E40

	thumb_func_start sub_08079FAC
sub_08079FAC: @ 0x08079FAC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0
	bl sub_080795A8
	adds r0, r4, #0
	movs r1, #0
	bl _08079B38
	ldr r2, [r4, #0x40]
	adds r2, #0x58
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	ldr r3, _0807A094 @ =gUnknown_0848B6A0
	ldr r1, _0807A098 @ =gUnknown_08615E44
	adds r0, r4, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #4
	lsls r0, r0, #0xc
	movs r1, #0x90
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa8
	bl PutSpriteExt
	adds r2, r4, #0
	adds r2, #0x4c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble _0807A002
	movs r0, #0x3c
	strh r0, [r2]
_0807A002:
	ldr r0, _0807A09C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0807A08C
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x3c
	bne _0807A08C
	movs r0, #0
	strh r0, [r2]
	ldr r1, _0807A0A0 @ =gUnknown_03001400
	ldr r2, _0807A0A4 @ =0x0000FF10
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0807A0A8 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1e
	movs r3, #6
	bl sub_0801A444
	ldr r3, _0807A0AC @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0807A0B0 @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0807A0B4 @ =gUnknown_03002B28
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0807A0B8 @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0807A0BC @ =0x0000FFE0
	ands r0, r1
	strh r0, [r3]
	ldrb r1, [r3]
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	ldr r0, _0807A0C0 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3]
	ldrb r0, [r3, #1]
	ands r2, r0
	strb r2, [r3, #1]
	adds r0, r4, #0
	bl Proc_Break
_0807A08C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A094: .4byte gUnknown_0848B6A0
_0807A098: .4byte gUnknown_08615E44
_0807A09C: .4byte gpKeySt
_0807A0A0: .4byte gUnknown_03001400
_0807A0A4: .4byte 0x0000FF10
_0807A0A8: .4byte gDispIo
_0807A0AC: .4byte gUnknown_030030E0
_0807A0B0: .4byte gUnknown_03002020
_0807A0B4: .4byte gUnknown_03002B28
_0807A0B8: .4byte gUnknown_03001FFC
_0807A0BC: .4byte 0x0000FFE0
_0807A0C0: .4byte 0x0000E0FF

	thumb_func_start sub_0807A0C4
sub_0807A0C4: @ 0x0807A0C4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4c
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xf0
	bl Interpolate
	adds r1, r0, #0
	str r1, [r4, #0x34]
	adds r0, r4, #0
	bl sub_080795A8
	ldr r1, [r4, #0x34]
	adds r0, r4, #0
	bl _08079B38
	ldr r1, [r4, #0x40]
	adds r0, r1, #0
	adds r0, #0x98
	ldr r2, [r4, #0x34]
	cmp r2, r0
	bgt _0807A12E
	subs r2, #0x58
	subs r2, r1, r2
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	ldr r3, _0807A1A4 @ =gUnknown_0848B6A0
	ldr r1, _0807A1A8 @ =gUnknown_08615E48
	adds r0, r4, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #4
	lsls r0, r0, #0xc
	movs r1, #0x90
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa8
	bl PutSpriteExt
_0807A12E:
	ldr r1, _0807A1AC @ =gUnknown_03001400
	ldr r0, [r4, #0x34]
	subs r0, #0xf0
	strh r0, [r1]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x30
	rsbs r1, r1, #0
	cmp r0, r1
	ble _0807A14E
	ldr r0, _0807A1B0 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #1]
_0807A14E:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0x1f
	ble _0807A182
	movs r1, #0x40
	rsbs r1, r1, #0
	adds r3, r0, #0
	subs r3, #0x20
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r2, #0x40
	bl Interpolate
	adds r1, r0, #0
	str r1, [r4, #0x3c]
	ldr r0, _0807A1B4 @ =0x000001FF
	ands r0, r1
	movs r2, #0xb0
	lsls r2, r2, #8
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
_0807A182:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0x2f
	ble _0807A194
	bl sub_0807A860
	adds r0, r4, #0
	bl Proc_Break
_0807A194:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A1A4: .4byte gUnknown_0848B6A0
_0807A1A8: .4byte gUnknown_08615E48
_0807A1AC: .4byte gUnknown_03001400
_0807A1B0: .4byte gDispIo
_0807A1B4: .4byte 0x000001FF

