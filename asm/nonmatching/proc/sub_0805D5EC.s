	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805D5EC
sub_0805D5EC: @ 0x0805D5EC
	push {r4, r5, lr}
	ldr r3, _0805D640 @ =gUnknown_0816DA40
	ldr r1, [r3]
	ldr r2, _0805D644 @ =gUnknown_030046C0
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r2, #2]
	strb r0, [r1, #2]
	ldrb r0, [r2, #3]
	strb r0, [r1, #3]
	ldrb r0, [r2, #4]
	strb r0, [r1, #4]
	ldrb r0, [r2, #5]
	strb r0, [r1, #5]
	ldrb r0, [r2, #1]
	strb r0, [r1, #1]
	ldr r0, [r2, #8]
	str r0, [r1, #8]
	ldrb r0, [r2, #6]
	strb r0, [r1, #6]
	ldrb r0, [r2, #7]
	strb r0, [r1, #7]
	ldrb r0, [r2, #0x12]
	strb r0, [r1, #0x12]
	movs r4, #0
	adds r5, r3, #0
	adds r3, r1, #0
	adds r3, #0xc
	adds r2, #0xc
_0805D626:
	adds r0, r4, r3
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #5
	ble _0805D626
	ldr r0, [r5]
	bl sub_080308B4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D640: .4byte gUnknown_0816DA40
_0805D644: .4byte gUnknown_030046C0

