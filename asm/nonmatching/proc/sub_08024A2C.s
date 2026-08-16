	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024A2C
sub_08024A2C: @ 0x08024A2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08024AAC @ =gUnknown_08499594
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r3, r1, #1
	adds r3, r3, r1
	lsls r3, r3, #2
	ldr r4, [r0]
	adds r3, r4, r3
	str r3, [r5]
	ldr r0, _08024AB0 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrb r1, [r3, #3]
	lsls r1, r1, #1
	ldr r6, _08024AB4 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r3, #2]
	adds r0, r0, r1
	ldr r1, _08024AB8 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0
	strh r1, [r5, #4]
	subs r4, r3, r4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r2, r0, #4
	adds r0, r0, r2
	lsls r2, r0, #8
	adds r0, r0, r2
	lsls r2, r0, #0x10
	adds r0, r0, r2
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r3]
	bl sub_080249EC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #6]
	ldr r1, [r5]
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	strh r0, [r5, #8]
	ldrh r0, [r1, #4]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1c
	strh r0, [r5, #0xa]
	strh r6, [r5, #0x18]
	strh r6, [r5, #0x10]
	strh r6, [r5, #0x12]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024AAC: .4byte gUnknown_08499594
_08024AB0: .4byte gUnknown_08499590
_08024AB4: .4byte 0x0000417A
_08024AB8: .4byte 0x00001432

