	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D724
sub_0803D724: @ 0x0803D724
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0803D738
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	bl sub_08016CEC
_0803D738:
	pop {r0}
	bx r0

