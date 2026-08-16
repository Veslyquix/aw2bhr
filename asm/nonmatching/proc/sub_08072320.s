	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072320
sub_08072320: @ 0x08072320
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08072344
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807233E
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08072338
	bl _call_via_r0
_08072338:
	adds r0, r4, #0
	bl Proc_Break
_0807233E:
	pop {r4}
	pop {r0}
	bx r0

