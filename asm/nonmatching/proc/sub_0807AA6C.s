	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807AA6C
sub_0807AA6C: @ 0x0807AA6C
	push {lr}
	bl sub_08078E20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807AA7E
	movs r0, #0xcd
	bl sub_0803B524
_0807AA7E:
	pop {r0}
	bx r0
	.align 2, 0

