	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024058
sub_08024058: @ 0x08024058
	push {r4, r5, lr}
	ldr r2, _080240A4 @ =gUnknown_08499590
	ldr r4, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r3, r1, #1
	ldr r5, _080240A8 @ =0x0000417A
	adds r2, r4, r5
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r2, r0
	ldr r3, _080240AC @ =0x00001432
	adds r4, r4, r3
	adds r4, r4, r2
	ldrb r5, [r4]
	movs r3, #0x1f
	ldr r2, _080240B0 @ =gUnknown_03004084
	ands r3, r5
	ldrb r2, [r2]
	adds r3, r3, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	strb r3, [r4]
	movs r2, #0xe0
	ands r2, r3
	bl sub_080240B4
	bl sub_08024268
	bl sub_080219AC
	bl sub_08026D68
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080240A4: .4byte gUnknown_08499590
_080240A8: .4byte 0x0000417A
_080240AC: .4byte 0x00001432
_080240B0: .4byte gUnknown_03004084

