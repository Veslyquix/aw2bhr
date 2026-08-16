	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080352B4
sub_080352B4: @ 0x080352B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	ldr r3, _08035344 @ =gUnknown_02027C68
_080352BE:
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
	ldrh r7, [r1, #2]
	adds r0, r0, r7
	strh r0, [r1, #2]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r0, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x1f
	ble _080352BE
	ldr r0, _08035348 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	lsls r4, r0, #0x14
	asrs r1, r4, #0x10
	lsls r0, r0, #4
	adds r0, #0x10
	cmp r1, r0
	bge _0803533A
	ldr r1, _08035344 @ =gUnknown_02027C68
	mov r8, r1
	movs r5, #0xff
	adds r6, r0, #0
_08035302:
	asrs r4, r4, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #2
	add r3, r8
	ldrh r0, [r3]
	lsrs r0, r0, #8
	ldr r1, _0803534C @ =gUnknown_08499590
	ldr r2, [r1]
	movs r7, #4
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	ands r0, r5
	ldrh r1, [r3, #2]
	lsrs r1, r1, #8
	movs r7, #6
	ldrsh r2, [r2, r7]
	subs r1, r1, r2
	ands r1, r5
	ldrh r3, [r3, #8]
	ldr r2, _08035350 @ =gUnknown_0849BD98
	bl sub_0801BDB4
	adds r4, #1
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	cmp r0, r6
	blt _08035302
_0803533A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035344: .4byte gUnknown_02027C68
_08035348: .4byte gUnknown_03004008
_0803534C: .4byte gUnknown_08499590
_08035350: .4byte gUnknown_0849BD98

