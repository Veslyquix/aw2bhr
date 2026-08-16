	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065200
sub_08065200: @ 0x08065200
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065234 @ =gUnknown_08580934
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	movs r0, #0x32
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0xf0
	subs r0, r0, r2
	adds r1, #1
	bl __divsi3
	adds r2, r0, #0
	cmp r4, #0
	ble _0806522C
	adds r1, r4, #0
_08065222:
	adds r0, #0x32
	adds r0, r0, r2
	subs r1, #1
	cmp r1, #0
	bne _08065222
_0806522C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065234: .4byte gUnknown_08580934

