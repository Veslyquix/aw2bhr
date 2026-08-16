	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803ECE8
sub_0803ECE8: @ 0x0803ECE8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0803ED2C @ =gUnknown_03003338
	ldr r1, [r0]
	ldr r3, _0803ED30 @ =gUnknown_08499594
	adds r0, r6, #0
	adds r0, #0x4c
	movs r4, #0
	ldrsh r2, [r0, r4]
	lsls r2, r2, #3
	adds r2, r2, r1
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r3]
	adds r5, r1, r0
	ldrb r3, [r5, #4]
	lsls r4, r3, #0x19
	lsrs r0, r4, #0x19
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	cmp r0, #0
	ble _0803ED34
	lsrs r0, r4, #0x19
	subs r0, r0, r1
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r5, #4]
	b _0803ED40
	.align 2, 0
_0803ED2C: .4byte gUnknown_03003338
_0803ED30: .4byte gUnknown_08499594
_0803ED34:
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r3
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #4]
_0803ED40:
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bl sub_08024268
	pop {r4, r5, r6}
	pop {r0}
	bx r0

