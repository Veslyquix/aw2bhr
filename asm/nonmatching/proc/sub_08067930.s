	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067930
sub_08067930: @ 0x08067930
	push {lr}
	adds r1, r0, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #1
	bne _08067942
	adds r0, r1, #0
	bl Proc_Break
_08067942:
	pop {r0}
	bx r0
	.align 2, 0

