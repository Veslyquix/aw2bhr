	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072288
sub_08072288: @ 0x08072288
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080116A0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807229C
	adds r0, r4, #0
	bl Proc_Break
_0807229C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

