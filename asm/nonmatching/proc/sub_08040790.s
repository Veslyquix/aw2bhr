	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040790
sub_08040790: @ 0x08040790
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080407D4 @ =gUnknown_0849FBEC
	bl Proc_StartBlocking
	adds r3, r0, #0
	str r5, [r3, #0x2c]
	str r4, [r3, #0x30]
	adds r1, r3, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #6
	strh r0, [r1]
	ldr r1, _080407D8 @ =gUnknown_020288B4
	ldr r0, _080407DC @ =gUnknown_08499590
	ldr r0, [r0]
	lsls r4, r4, #1
	ldr r6, _080407E0 @ =0x0000417A
	adds r0, r0, r6
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	str r2, [r3, #0x4c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080407D4: .4byte gUnknown_0849FBEC
_080407D8: .4byte gUnknown_020288B4
_080407DC: .4byte gUnknown_08499590
_080407E0: .4byte 0x0000417A

