	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027198
sub_08027198: @ 0x08027198
	push {r4, lr}
	adds r4, r0, #0
	movs r3, #1
	ldr r1, _080271B8 @ =gUnknown_08499598
	ldr r1, [r1]
	adds r2, r1, #0
	adds r2, #0x56
_080271A6:
	ldrb r1, [r2, #1]
	cmp r1, #0
	beq _080271BC
	ldrb r1, [r2]
	cmp r1, r4
	bne _080271BC
	adds r0, r3, #0
	b _080271C4
	.align 2, 0
_080271B8: .4byte gUnknown_08499598
_080271BC:
	adds r2, #0x3c
	adds r3, #1
	cmp r3, #4
	ble _080271A6
_080271C4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

