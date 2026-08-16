	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A8B4
sub_0807A8B4: @ 0x0807A8B4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08078E20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807A8C8
	movs r0, #0
	bl sub_0803B5A4
_0807A8C8:
	movs r4, #0
_0807A8CA:
	adds r0, r4, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08071B0C
	adds r4, #1
	cmp r4, #6
	ble _0807A8CA
	movs r0, #8
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08071B0C
	movs r0, #0x1b
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08071B0C
	pop {r4, r5}
	pop {r0}
	bx r0

