	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080353E8
sub_080353E8: @ 0x080353E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	ldr r3, _08035480 @ =gUnknown_02027DE8
_080353F2:
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r1, #4]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	ldrh r0, [r1, #6]
	ldrh r4, [r1, #2]
	adds r0, r0, r4
	strh r0, [r1, #2]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r0, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x1f
	ble _080353F2
	ldr r0, _08035484 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	lsls r5, r0, #0x14
	asrs r1, r5, #0x10
	lsls r0, r0, #4
	adds r0, #0x10
	cmp r1, r0
	bge _08035474
	ldr r1, _08035480 @ =gUnknown_02027DE8
	mov r8, r1
	movs r6, #0xff
	adds r7, r0, #0
_08035436:
	asrs r5, r5, #0x10
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #2
	add r3, r8
	ldrh r0, [r3]
	lsrs r0, r0, #8
	ldr r1, _08035488 @ =gUnknown_08499590
	ldr r2, [r1]
	movs r4, #4
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	ands r0, r6
	ldrh r1, [r3, #2]
	lsrs r1, r1, #8
	movs r4, #6
	ldrsh r2, [r2, r4]
	subs r1, r1, r2
	ands r1, r6
	ldr r4, _0803548C @ =gUnknown_0849BDA0
	ldrh r2, [r3, #8]
	lsls r2, r2, #3
	adds r2, r2, r4
	movs r3, #0
	bl sub_0801BDB4
	adds r5, #1
	lsls r5, r5, #0x10
	asrs r0, r5, #0x10
	cmp r0, r7
	blt _08035436
_08035474:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035480: .4byte gUnknown_02027DE8
_08035484: .4byte gUnknown_03004008
_08035488: .4byte gUnknown_08499590
_0803548C: .4byte gUnknown_0849BDA0

