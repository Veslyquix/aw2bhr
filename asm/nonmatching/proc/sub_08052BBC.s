	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052BBC
sub_08052BBC: @ 0x08052BBC
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r0, #0
	mov sb, r1
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _08052C8C @ =gUnknown_0300453C
	strh r6, [r0]
	ldr r0, _08052C90 @ =gUnknown_0300451C
	mov r1, sb
	strh r1, [r0]
	mov r2, sb
	lsls r5, r2, #1
	lsls r0, r6, #2
	mov sl, r0
	ldr r0, _08052C94 @ =gUnknown_0855371C
	ldr r4, _08052C98 @ =gUnknown_02029808
	movs r1, #0x6c
	adds r2, r6, #0
	muls r2, r1, r2
	mov r8, r2
	adds r1, r2, r4
	ldrh r3, [r1, #0x2e]
	lsls r3, r3, #2
	add r3, r8
	adds r1, r4, #0
	adds r1, #0x44
	adds r1, r3, r1
	ldr r2, [r1]
	adds r1, r4, #0
	adds r1, #0x58
	adds r3, r3, r1
	ldr r3, [r3]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl sub_08015410
	add r5, r8
	adds r4, #0x24
	adds r5, r5, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #1
	bl sub_08015504
	adds r0, r6, #0
	movs r1, #0x23
	bl sub_080504A8
	ldr r1, _08052C9C @ =gUnknown_08553B10
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	bl sub_08016824
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_08016944
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0xc0
	lsls r1, r1, #1
	bl sub_080157F4
	ldr r0, _08052CA0 @ =gUnknown_02028E5C
	add sl, r0
	movs r0, #1
	mov r2, sl
	strh r0, [r2]
	adds r0, r6, #0
	mov r1, sb
	bl sub_08052818
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052C8C: .4byte gUnknown_0300453C
_08052C90: .4byte gUnknown_0300451C
_08052C94: .4byte gUnknown_0855371C
_08052C98: .4byte gUnknown_02029808
_08052C9C: .4byte gUnknown_08553B10
_08052CA0: .4byte gUnknown_02028E5C

