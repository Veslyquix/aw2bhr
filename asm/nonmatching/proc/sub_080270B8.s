	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080270B8
sub_080270B8: @ 0x080270B8
	push {r4, lr}
	movs r3, #1
	ldr r0, _080270DC @ =gUnknown_08499598
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x4f
	movs r4, #0x20
_080270C6:
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _080270E0
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080270E0
	movs r0, #1
	b _080270EA
	.align 2, 0
_080270DC: .4byte gUnknown_08499598
_080270E0:
	adds r2, #0x3c
	adds r3, #1
	cmp r3, #4
	ble _080270C6
	movs r0, #0
_080270EA:
	pop {r4}
	pop {r1}
	bx r1

