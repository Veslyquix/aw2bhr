	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067498
sub_08067498: @ 0x08067498
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080718F0
	bl sub_080135A4
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0
	bge _080674B4
	adds r0, r4, #0
	bl Proc_Break
_080674B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

