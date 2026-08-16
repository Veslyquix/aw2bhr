	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034AF8
sub_08034AF8: @ 0x08034AF8
	push {r4, r5, lr}
	bl sub_080348B4
	lsls r0, r0, #0x18
	ldr r5, _08034B3C @ =gUnknown_08090E24
	cmp r0, #0
	bne _08034B08
	b _08034C3A
_08034B08:
	ldr r0, [r5]
	ldrh r0, [r0]
	bl sub_08026704
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08034B40 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #0x1a]
	movs r0, #0x4e
	bl sub_08034A7C
	ldr r0, _08034B44 @ =gUnknown_02028E40
	ldrb r0, [r0]
	cmp r0, #1
	beq _08034B8C
	cmp r0, #1
	bgt _08034B48
	cmp r0, #0
	beq _08034B52
	b _08034C2C
	.align 2, 0
_08034B3C: .4byte gUnknown_08090E24
_08034B40: .4byte gUnknown_08499598
_08034B44: .4byte gUnknown_02028E40
_08034B48:
	cmp r0, #2
	beq _08034BC8
	cmp r0, #3
	beq _08034C04
	b _08034C2C
_08034B52:
	ldr r1, _08034B7C @ =gUnknown_08090DA4
	movs r0, #0x38
	bl sub_08034A58
	ldr r4, _08034B80 @ =gUnknown_08090D90
	ldr r0, _08034B84 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #3
	bl __udivsi3
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, #0x68
	ldr r1, _08034B88 @ =gUnknown_08090DB0
	bl sub_08034A58
	b _08034C2C
	.align 2, 0
_08034B7C: .4byte gUnknown_08090DA4
_08034B80: .4byte gUnknown_08090D90
_08034B84: .4byte gUnknown_03004008
_08034B88: .4byte gUnknown_08090DB0
_08034B8C:
	ldr r1, _08034BB8 @ =gUnknown_08090DC0
	movs r0, #0x38
	bl sub_08034A58
	ldr r4, _08034BBC @ =gUnknown_08090D90
	ldr r0, _08034BC0 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #3
	bl __udivsi3
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, #0x68
	ldr r1, _08034BC4 @ =gUnknown_08090DD0
	bl sub_08034A58
	b _08034C2C
	.align 2, 0
_08034BB8: .4byte gUnknown_08090DC0
_08034BBC: .4byte gUnknown_08090D90
_08034BC0: .4byte gUnknown_03004008
_08034BC4: .4byte gUnknown_08090DD0
_08034BC8:
	ldr r1, _08034BF4 @ =gUnknown_08090DE0
	movs r0, #0x38
	bl sub_08034A58
	ldr r4, _08034BF8 @ =gUnknown_08090D90
	ldr r0, _08034BFC @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #3
	bl __udivsi3
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, #0x68
	ldr r1, _08034C00 @ =gUnknown_08090DF0
	bl sub_08034A58
	b _08034C2C
	.align 2, 0
_08034BF4: .4byte gUnknown_08090DE0
_08034BF8: .4byte gUnknown_08090D90
_08034BFC: .4byte gUnknown_03004008
_08034C00: .4byte gUnknown_08090DF0
_08034C04:
	ldr r1, _08034C74 @ =gUnknown_08090E04
	movs r0, #0x30
	bl sub_08034A58
	ldr r4, _08034C78 @ =gUnknown_08090D90
	ldr r0, _08034C7C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #3
	bl __udivsi3
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, #0x68
	ldr r1, _08034C80 @ =gUnknown_08090E14
	bl sub_08034A58
_08034C2C:
	ldr r0, _08034C84 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08034C6E
_08034C3A:
	bl sub_08026768
	bl sub_080268F4
	ldr r0, [r5]
	ldrh r0, [r0]
	bl sub_08044178
	bl sub_08024268
	bl sub_08062038
	bl sub_080348B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08034C60
	bl sub_0802BFBC
_08034C60:
	bl sub_08034C8C
	bl sub_0803B5E8
	ldr r1, _08034C88 @ =gUnknown_030032D8
	movs r0, #4
	strh r0, [r1]
_08034C6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034C74: .4byte gUnknown_08090E04
_08034C78: .4byte gUnknown_08090D90
_08034C7C: .4byte gUnknown_03004008
_08034C80: .4byte gUnknown_08090E14
_08034C84: .4byte gpKeySt
_08034C88: .4byte gUnknown_030032D8

