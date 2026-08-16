	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CFDC
sub_0802CFDC: @ 0x0802CFDC
	push {lr}
	bl sub_0801A168
	ldr r0, _0802CFF8 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	bl sub_08016D04
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	lsrs r0, r0, #0x10
	bl sub_08016DB8
	pop {r0}
	bx r0
	.align 2, 0
_0802CFF8: .4byte gUnknown_03003FC0

