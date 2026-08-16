	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AF68
sub_0804AF68: @ 0x0804AF68
	push {lr}
	sub sp, #4
	ldr r2, _0804AF84 @ =0x00006827
	movs r0, #0
	str r0, [sp]
	movs r0, #0x38
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804AF84: .4byte 0x00006827

