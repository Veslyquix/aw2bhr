	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080270F0
sub_080270F0: @ 0x080270F0
	movs r2, #1
	ldr r0, _08027108 @ =gUnknown_08499598
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x3c
_080270FA:
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	bne _0802710C
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	b _08027116
	.align 2, 0
_08027108: .4byte gUnknown_08499598
_0802710C:
	adds r1, #0x3c
	adds r2, #1
	cmp r2, #4
	ble _080270FA
	movs r0, #0
_08027116:
	bx lr

