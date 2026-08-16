	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080203C0
sub_080203C0: @ 0x080203C0
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	cmp r3, #0
	ble _080203DA
	ldr r1, _08020424 @ =gUnknown_03003340
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r3, r0
	subs r0, #1
	movs r1, #0
	strb r1, [r0]
_080203DA:
	ldr r4, _08020428 @ =gUnknown_08499590
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r3, r0
	bgt _080203F2
	ldr r1, _08020424 @ =gUnknown_03003340
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r3, r0
	movs r1, #0
	strb r1, [r0, #1]
_080203F2:
	cmp r2, #0
	ble _08020406
	ldr r1, _08020424 @ =gUnknown_03003340
	subs r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	strb r1, [r0]
_08020406:
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r2, r0
	bgt _0802041E
	ldr r1, _08020424 @ =gUnknown_03003340
	adds r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	strb r1, [r0]
_0802041E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020424: .4byte gUnknown_03003340
_08020428: .4byte gUnknown_08499590

