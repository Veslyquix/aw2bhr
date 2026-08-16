	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080848FC
sub_080848FC: @ 0x080848FC
	push {r4, lr}
	movs r4, #0
_08084900:
	adds r0, r4, #0
	bl sub_0803CAD4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08084910
	movs r0, #0
	b _08084918
_08084910:
	adds r4, #1
	cmp r4, #0x12
	ble _08084900
	movs r0, #1
_08084918:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

