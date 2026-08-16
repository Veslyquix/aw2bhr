	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072394
sub_08072394: @ 0x08072394
	push {lr}
	movs r0, #0x10
	movs r1, #0x10
	movs r2, #0
	bl sub_08013780
	bl sub_080723C0
	pop {r0}
	bx r0

