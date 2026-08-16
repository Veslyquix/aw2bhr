	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A8F4
sub_0807A8F4: @ 0x0807A8F4
	push {lr}
	bl sub_08078E20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807A904
	bl sub_0803B3C8
_0807A904:
	pop {r0}
	bx r0

