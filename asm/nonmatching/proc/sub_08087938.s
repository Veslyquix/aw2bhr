	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087938
sub_08087938: @ 0x08087938
	push {r4, lr}
	movs r0, #0x61
	bl sub_0801F234
	movs r0, #0x60
	bl sub_0801F234
	movs r4, #0
_08087948:
	adds r0, r4, #0
	adds r0, #0x79
	bl sub_0801F234
	adds r0, r4, #0
	adds r0, #0x6f
	bl sub_0801F234
	adds r4, #1
	cmp r4, #9
	ble _08087948
	movs r4, #0
_08087960:
	adds r0, r4, #0
	adds r0, #0x6a
	bl sub_0801F234
	adds r4, #1
	cmp r4, #4
	ble _08087960
	pop {r4}
	pop {r0}
	bx r0

