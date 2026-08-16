	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085888
sub_08085888: @ 0x08085888
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0808588E:
	adds r0, r4, #0
	movs r1, #8
	adds r2, r5, #0
	bl sub_08071AF0
	adds r4, #1
	cmp r4, #5
	ble _0808588E
	movs r0, #8
	movs r1, #8
	adds r2, r5, #0
	bl sub_08071AF0
	movs r4, #0x10
_080858AA:
	adds r0, r4, #0
	movs r1, #8
	adds r2, r5, #0
	bl sub_08071AF0
	adds r4, #1
	cmp r4, #0x16
	ble _080858AA
	pop {r4, r5}
	pop {r0}
	bx r0

