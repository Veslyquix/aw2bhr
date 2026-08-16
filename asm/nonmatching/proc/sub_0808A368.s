	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A368
sub_0808A368: @ 0x0808A368
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0808A36E:
	adds r0, r4, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08071AF0
	adds r4, #1
	cmp r4, #3
	ble _0808A36E
	movs r0, #8
	movs r1, #8
	adds r2, r5, #0
	bl sub_08071AF0
	movs r4, #0x10
_0808A38A:
	adds r0, r4, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08071AF0
	adds r4, #1
	cmp r4, #0x1c
	ble _0808A38A
	pop {r4, r5}
	pop {r0}
	bx r0

