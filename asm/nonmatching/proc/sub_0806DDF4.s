	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806DDF4
sub_0806DDF4: @ 0x0806DDF4
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _0806DE34 @ =gUnknown_0816E1B8
	ldr r4, [r5]
	movs r3, #0
_0806DDFE:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x54
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x46
	strb r3, [r0]
	adds r2, #1
	cmp r2, #6
	ble _0806DDFE
	ldr r0, [r5]
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x54
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #0x46
	movs r1, #1
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806DE34: .4byte gUnknown_0816E1B8

