	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D8F8
sub_0803D8F8: @ 0x0803D8F8
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #6
	bne _0803D90A
	bl sub_08016E14
	b _0803D910
_0803D90A:
	ldrb r0, [r1, #0x10]
	bl sub_08016C70
_0803D910:
	pop {r0}
	bx r0

