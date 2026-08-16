	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033174
sub_08033174: @ 0x08033174
	push {lr}
	ldr r1, _08033190 @ =0x0000FFD0
	movs r0, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	pop {r0}
	bx r0
	.align 2, 0
_08033190: .4byte 0x0000FFD0

