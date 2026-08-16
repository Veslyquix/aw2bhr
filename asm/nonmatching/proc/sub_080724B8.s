	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080724B8
sub_080724B8: @ 0x080724B8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	bne _080724CA
	adds r0, r1, #0
	bl Proc_Break
	b _080724CE
_080724CA:
	subs r0, #1
	str r0, [r1, #0x58]
_080724CE:
	pop {r0}
	bx r0
	.align 2, 0

