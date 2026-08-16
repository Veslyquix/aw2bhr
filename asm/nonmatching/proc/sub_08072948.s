	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072948
sub_08072948: @ 0x08072948
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08072968
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
_08072968:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

