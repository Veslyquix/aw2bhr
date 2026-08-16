	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080501DC
sub_080501DC: @ 0x080501DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r3, _0805032C @ =gUnknown_03001470
	ldr r1, _08050330 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r1, r3, #0
	adds r1, #0x30
	adds r1, r2, r1
	ldrh r6, [r1]
	mov sl, r6
	adds r3, #0x34
	adds r2, r2, r3
	ldrh r1, [r2]
	mov sb, r1
	bl sub_080156C4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	str r5, [sp]
	adds r0, r6, #0
	mov r1, sb
	bl sub_08056E9C
	ldr r1, _08050334 @ =gUnknown_02029B94
	lsls r3, r6, #2
	mov r8, r3
	adds r4, r3, r6
	mov r2, sb
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r7, r0, r1
	ldr r1, _08050338 @ =gUnknown_02029B80
	adds r1, r0, r1
	ldrh r0, [r1]
	ldrh r3, [r7]
	adds r0, r0, r3
	movs r2, #0
	strh r0, [r7]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _08050244
	strh r2, [r7]
	strh r2, [r1]
_08050244:
	ldr r0, _0805033C @ =gUnknown_084C3F70
	add r0, r8
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _08050340 @ =gUnknown_084C3F78
	add r0, r8
	ldr r0, [r0]
	str r0, [sp, #8]
	cmp r5, #0x1c
	bne _08050298
	ldr r5, _08050344 @ =gUnknown_085D6C88
	ldr r0, _08050348 @ =gUnknown_020296B0
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r0, [r4, #0x1a]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, _0805034C @ =gUnknown_03004580
	lsls r3, r6, #4
	adds r0, r2, #4
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r2, #2
	adds r3, r3, r2
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r5, #0xc
	adds r1, r1, r5
	movs r5, #0
	ldrsh r0, [r1, r5]
	bl sub_0803B48C
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
_08050298:
	ldr r0, [sp]
	cmp r0, #3
	bne _080502A6
	ldr r1, _08050350 @ =gUnknown_03004544
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080502A6:
	ldr r2, _08050354 @ =gUnknown_085523B0
	ldrh r1, [r7]
	lsls r3, r1, #2
	mov r4, sl
	lsls r0, r4, #1
	add r0, sl
	lsls r0, r0, #3
	adds r3, r3, r0
	adds r3, r3, r2
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r2, _08050358 @ =gUnknown_085644D4
	ldr r0, _0805035C @ =gUnknown_02028E5C
	add r0, r8
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r2, [r1]
	ldrh r0, [r0]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	ldr r4, _08050360 @ =gUnknown_02029A10
	mov r5, sb
	lsls r0, r5, #3
	add r0, sb
	lsls r0, r0, #2
	movs r1, #0xb4
	mov r5, sl
	muls r5, r1, r5
	adds r1, r5, #0
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r1, [r0, #8]
	ldrh r3, [r3]
	adds r1, r1, r3
	strh r1, [r0, #8]
	lsrs r2, r2, #0x10
	ldrh r3, [r0, #0xa]
	adds r2, r2, r3
	strh r2, [r0, #0xa]
	ldr r4, _08050330 @ =gUnknown_03001FBC
	movs r5, #0
	ldrsh r0, [r4, r5]
	ldr r4, [sp, #4]
	ldrh r3, [r4]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r5, [sp, #8]
	ldrh r3, [r5]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805032C: .4byte gUnknown_03001470
_08050330: .4byte gUnknown_03001FBC
_08050334: .4byte gUnknown_02029B94
_08050338: .4byte gUnknown_02029B80
_0805033C: .4byte gUnknown_084C3F70
_08050340: .4byte gUnknown_084C3F78
_08050344: .4byte gUnknown_085D6C88
_08050348: .4byte gUnknown_020296B0
_0805034C: .4byte gUnknown_03004580
_08050350: .4byte gUnknown_03004544
_08050354: .4byte gUnknown_085523B0
_08050358: .4byte gUnknown_085644D4
_0805035C: .4byte gUnknown_02028E5C
_08050360: .4byte gUnknown_02029A10

