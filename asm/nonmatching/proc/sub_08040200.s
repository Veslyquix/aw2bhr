	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040200
sub_08040200: @ 0x08040200
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_0803FECC
	ldr r5, _0804025C @ =gUnknown_08499590
	ldr r2, [r5]
	ldrb r1, [r4, #1]
	lsls r1, r1, #1
	ldr r3, _08040260 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r4]
	adds r0, r0, r1
	ldr r1, _08040264 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	movs r0, #1
	strb r0, [r2]
	ldr r2, [r5]
	ldrb r0, [r4, #1]
	lsls r0, r0, #1
	adds r3, r2, r3
	adds r3, r3, r0
	ldrh r0, [r3]
	ldrb r1, [r4]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08040268 @ =0x00000A22
	adds r2, r2, r1
	adds r2, r2, r0
	movs r0, #4
	strh r0, [r2]
	bl sub_08024268
	adds r0, r4, #0
	bl sub_0803E0D0
	bl sub_080219AC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804025C: .4byte gUnknown_08499590
_08040260: .4byte 0x0000417A
_08040264: .4byte 0x00001432
_08040268: .4byte 0x00000A22

