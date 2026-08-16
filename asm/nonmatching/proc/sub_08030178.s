	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030178
sub_08030178: @ 0x08030178
	push {r4, r5, r6, lr}
	ldr r5, _080301D8 @ =gUnknown_08090CAC
	ldr r6, [r5]
	ldr r1, [r6]
	ldrh r0, [r1]
	adds r0, #1
	ldrh r2, [r1]
	movs r4, #0
	strh r0, [r1]
	ldrh r2, [r1]
	movs r0, #7
	ands r0, r2
	ldrh r2, [r1]
	strh r0, [r1]
	bl sub_08013434
	ldr r0, _080301DC @ =0x04000208
	strh r4, [r0]
	movs r2, #0
	ldr r0, _080301E0 @ =0x0000FFFF
	adds r4, r0, #0
_080301A2:
	ldr r0, [r6]
	lsls r1, r2, #1
	adds r0, #8
	adds r0, r0, r1
	ldrh r1, [r0]
	orrs r1, r4
	strh r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _080301A2
	ldr r3, [r5]
	ldr r1, [r3]
	ldrh r0, [r1, #6]
	movs r2, #0
	ldr r0, _080301E4 @ =0x00005FFF
	strh r0, [r1, #6]
	ldrb r0, [r1, #5]
	strb r2, [r1, #5]
	ldr r0, [r3]
	ldrb r1, [r0, #4]
	movs r1, #1
	strb r1, [r0, #4]
	ldr r0, _080301DC @ =0x04000208
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080301D8: .4byte gUnknown_08090CAC
_080301DC: .4byte 0x04000208
_080301E0: .4byte 0x0000FFFF
_080301E4: .4byte 0x00005FFF

