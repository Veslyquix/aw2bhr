	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080520B8
sub_080520B8: @ 0x080520B8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08052140 @ =gUnknown_0300453C
	strh r5, [r0]
	ldr r0, _08052144 @ =gUnknown_0300451C
	strh r1, [r0]
	ldr r2, _08052148 @ =gUnknown_08552178
	lsls r1, r1, #1
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r1, r0
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r0, #6
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r4, _0805214C @ =gUnknown_02029808
	movs r0, #0x6c
	adds r2, r5, #0
	muls r2, r0, r2
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x24
	adds r6, r1, r0
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08052136
	ldr r0, _08052150 @ =gUnknown_085536D4
	adds r1, r2, r4
	ldrh r3, [r1, #0x2e]
	lsls r3, r3, #2
	adds r3, r3, r2
	adds r1, r4, #0
	adds r1, #0x44
	adds r1, r3, r1
	ldr r2, [r1]
	adds r1, r4, #0
	adds r1, #0x58
	adds r3, r3, r1
	ldr r3, [r3]
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #1
	bl sub_08015410
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r6]
	adds r0, r5, #0
	movs r1, #0x10
	bl sub_080504A8
_08052136:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052140: .4byte gUnknown_0300453C
_08052144: .4byte gUnknown_0300451C
_08052148: .4byte gUnknown_08552178
_0805214C: .4byte gUnknown_02029808
_08052150: .4byte gUnknown_085536D4

