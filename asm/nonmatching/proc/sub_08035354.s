	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035354
sub_08035354: @ 0x08035354
	push {r4, r5, r6, r7, lr}
	ldr r0, _080353D8 @ =gUnknown_080916FC
	ldr r1, _080353DC @ =0x06012E60
	movs r2, #0x60
	bl sub_08011C68
	movs r4, #0
	ldr r7, _080353E0 @ =gUnknown_02027DE8
	ldr r6, _080353E4 @ =gUnknown_08090E40
_08035366:
	bl sub_080129E0
	lsls r1, r4, #0x10
	asrs r4, r1, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r5, r1, r7
	movs r1, #0xff
	bl __umodsi3
	lsls r0, r0, #8
	strh r0, [r5]
	bl sub_080129E0
	movs r1, #0xff
	bl __umodsi3
	lsls r0, r0, #8
	strh r0, [r5, #2]
	adds r0, r4, #0
	cmp r4, #0
	bge _08035396
	adds r0, #0xf
_08035396:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	strh r0, [r5, #4]
	adds r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #3
	strh r0, [r5, #6]
	adds r2, #2
	lsls r2, r2, #1
	adds r2, r2, r6
	ldrh r0, [r2]
	strh r0, [r5, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08035366
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080353D8: .4byte gUnknown_080916FC
_080353DC: .4byte 0x06012E60
_080353E0: .4byte gUnknown_02027DE8
_080353E4: .4byte gUnknown_08090E40

