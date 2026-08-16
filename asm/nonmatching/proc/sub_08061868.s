	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061868
sub_08061868: @ 0x08061868
	push {r4, r5, r6, lr}
	ldr r4, _0806188C @ =gUnknown_0816DB04
	ldr r5, [r4]
	bl sub_0803866C
	adds r6, r4, #0
	cmp r0, #0
	beq _08061898
	ldr r2, _08061890 @ =gUnknown_08615194
	ldr r0, _08061894 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	subs r1, #0x8a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, #0x28
	b _080618A8
	.align 2, 0
_0806188C: .4byte gUnknown_0816DB04
_08061890: .4byte gUnknown_08615194
_08061894: .4byte gUnknown_03003FC0
_08061898:
	ldr r2, _0806190C @ =gUnknown_08615194
	ldr r0, _08061910 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	subs r1, #0x8a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, #0x24
_080618A8:
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r5]
	bl sub_08061CDC
	bl sub_08061CF8
	bl sub_08061F34
	ldr r4, _08061914 @ =gUnknown_030033EC
	ldrh r0, [r4]
	bl sub_08061788
	bl sub_08062028
	bl sub_0806279C
	movs r0, #0
	bl sub_08062C7C
	bl sub_08061E98
	ldr r1, _08061918 @ =gUnknown_03004780
	movs r0, #1
	strh r0, [r1]
	ldr r2, _0806191C @ =gUnknown_030044D8
	ldr r1, _08061920 @ =gUnknown_03004770
	movs r0, #0
	str r0, [r1]
	strb r0, [r2]
	ldrh r1, [r4]
	ldr r0, _08061924 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	cmp r0, #5
	bne _08061904
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	beq _08061904
	bl sub_080607E8
_08061904:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806190C: .4byte gUnknown_08615194
_08061910: .4byte gUnknown_03003FC0
_08061914: .4byte gUnknown_030033EC
_08061918: .4byte gUnknown_03004780
_0806191C: .4byte gUnknown_030044D8
_08061920: .4byte gUnknown_03004770
_08061924: .4byte gUnknown_08499598

