	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084580
sub_08084580: @ 0x08084580
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08071B0C
	movs r4, #0x10
_08084590:
	adds r0, r4, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08071B0C
	adds r4, #1
	cmp r4, #0x1d
	ble _08084590
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

