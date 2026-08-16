	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C1D0
sub_0802C1D0: @ 0x0802C1D0
	push {lr}
	ldr r0, _0802C1EC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	bl sub_08016D04
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_08016D30
	pop {r0}
	bx r0
	.align 2, 0
_0802C1EC: .4byte gUnknown_03003FC0

