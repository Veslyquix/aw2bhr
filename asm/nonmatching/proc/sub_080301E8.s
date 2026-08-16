	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080301E8
sub_080301E8: @ 0x080301E8
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _08030230 @ =gUnknown_08090CB0
	ldr r6, [r7]
	movs r5, #0x82
	lsls r5, r5, #2
_080301F4:
	ldr r1, [r6]
	lsls r2, r4, #1
	adds r3, r1, r5
	adds r3, r3, r2
	ldrb r0, [r1, #5]
	lsls r0, r0, #3
	adds r2, r2, r0
	adds r1, #8
	adds r1, r1, r2
	ldrh r0, [r1]
	ldrh r1, [r3]
	strh r0, [r3]
	adds r4, #1
	cmp r4, #3
	ble _080301F4
	ldr r2, [r7]
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	adds r0, #1
	ldrb r3, [r1, #5]
	strb r0, [r1, #5]
	ldr r1, [r2]
	ldrb r2, [r1, #5]
	movs r0, #0x3f
	ands r0, r2
	ldrb r2, [r1, #5]
	strb r0, [r1, #5]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030230: .4byte gUnknown_08090CB0

