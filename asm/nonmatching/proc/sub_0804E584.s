	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804E584
sub_0804E584: @ 0x0804E584
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _0804E764 @ =gUnknown_03001470
	ldr r0, _0804E768 @ =gUnknown_08136080
	ldr r3, [r0]
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r5, _0804E76C @ =gUnknown_08136084
	mov sb, r5
	ldr r4, [r5]
	ldrh r1, [r4]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r2, #0x34
	adds r0, r0, r2
	ldr r1, _0804E770 @ =gUnknown_08136088
	ldr r2, [r1]
	ldrh r1, [r2]
	str r1, [r0]
	ldrh r0, [r4]
	ldrh r1, [r2]
	movs r5, #0
	ldrsh r2, [r3, r5]
	bl sub_0804BFC0
	ldr r5, _0804E774 @ =gUnknown_085D6A48
	ldr r7, _0804E778 @ =gUnknown_0813608C
	ldr r3, [r7]
	ldrh r2, [r4]
	lsls r2, r2, #4
	adds r0, r3, #2
	adds r0, r2, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r3, #6
	adds r2, r2, r3
	ldrh r1, [r2]
	bl sub_08057D44
	mov ip, r0
	ldr r2, _0804E77C @ =gUnknown_085644E0
	ldr r0, _0804E780 @ =gUnknown_0300450C
	ldrh r0, [r0]
	lsls r0, r0, #1
	ldrh r1, [r4]
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r6, [r0]
	ldr r0, _0804E784 @ =gUnknown_03004504
	ldrb r2, [r0]
	movs r0, #1
	ands r0, r2
	mov r5, sb
	cmp r0, #0
	beq _0804E620
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _0804E620
	movs r6, #0
_0804E620:
	ldr r7, _0804E788 @ =gUnknown_02029A10
	ldr r0, _0804E78C @ =gUnknown_0300451C
	ldrh r4, [r0]
	lsls r2, r4, #3
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r5, [r5]
	ldrh r3, [r5]
	movs r0, #0xb4
	mov r8, r0
	mov r0, r8
	muls r0, r3, r0
	adds r2, r2, r0
	adds r2, r2, r7
	lsls r0, r3, #4
	ldr r1, _0804E790 @ =gUnknown_03004580
	adds r1, #0xa
	mov sb, r1
	add r0, sb
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #4]
	ldr r2, _0804E78C @ =gUnknown_0300451C
	ldrh r0, [r2]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldrh r0, [r5]
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r1, r0
	adds r1, r1, r7
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldrh r4, [r1, #4]
	adds r0, r0, r4
	strh r0, [r1, #8]
	ldrh r4, [r2]
	lsls r2, r4, #3
	adds r2, r2, r4
	lsls r2, r2, #2
	ldrh r3, [r5]
	mov r0, r8
	muls r0, r3, r0
	adds r2, r2, r0
	adds r2, r2, r7
	lsls r0, r3, #4
	add r0, sb
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	strh r0, [r2, #6]
	ldr r0, _0804E78C @ =gUnknown_0300451C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r5]
	mov r2, r8
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	adds r0, r0, r7
	ldrh r1, [r0, #6]
	strh r1, [r0, #0xa]
	ldrh r0, [r5]
	ldr r3, _0804E78C @ =gUnknown_0300451C
	ldrh r1, [r3]
	ldr r3, _0804E794 @ =gUnknown_0855214C
	lsls r2, r0, #1
	adds r2, r2, r3
	movs r4, #0
	ldrsh r2, [r2, r4]
	movs r3, #0x32
	bl sub_0804BCB8
	ldr r0, _0804E798 @ =gUnknown_084C3F70
	ldrh r3, [r5]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r4, [r0]
	ldr r0, _0804E79C @ =gUnknown_084C3F78
	adds r1, r1, r0
	ldr r1, [r1]
	mov sl, r1
	ldr r0, _0804E7A0 @ =gUnknown_03001FBC
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, _0804E78C @ =gUnknown_0300451C
	ldrh r1, [r2]
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	mov r1, r8
	muls r1, r3, r1
	adds r2, r2, r1
	adds r2, r2, r7
	ldrh r1, [r2, #8]
	ldrh r3, [r4]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #0xa]
	mov r4, sl
	ldrh r3, [r4]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r4, _0804E7A4 @ =gUnknown_08552FB8
	ldrh r2, [r5]
	lsls r2, r2, #4
	ldr r1, _0804E790 @ =gUnknown_03004580
	adds r1, #4
	adds r1, r2, r1
	ldrh r1, [r1]
	lsls r3, r1, #1
	adds r3, r3, r1
	ldr r1, _0804E790 @ =gUnknown_03004580
	adds r1, #2
	adds r2, r2, r1
	ldrh r2, [r2]
	lsls r1, r2, #3
	adds r1, r1, r2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r4, #8
	adds r1, r1, r4
	ldr r1, [r1]
	bl sub_08015928
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E764: .4byte gUnknown_03001470
_0804E768: .4byte gUnknown_08136080
_0804E76C: .4byte gUnknown_08136084
_0804E770: .4byte gUnknown_08136088
_0804E774: .4byte gUnknown_085D6A48
_0804E778: .4byte gUnknown_0813608C
_0804E77C: .4byte gUnknown_085644E0
_0804E780: .4byte gUnknown_0300450C
_0804E784: .4byte gUnknown_03004504
_0804E788: .4byte gUnknown_02029A10
_0804E78C: .4byte gUnknown_0300451C
_0804E790: .4byte gUnknown_03004580
_0804E794: .4byte gUnknown_0855214C
_0804E798: .4byte gUnknown_084C3F70
_0804E79C: .4byte gUnknown_084C3F78
_0804E7A0: .4byte gUnknown_03001FBC
_0804E7A4: .4byte gUnknown_08552FB8

