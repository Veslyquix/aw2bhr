	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033910
sub_08033910: @ 0x08033910
	push {lr}
	sub sp, #4
	ldr r2, _0803392C @ =0x0000717C
	movs r0, #0
	str r0, [sp]
	movs r0, #0x38
	movs r1, #0xb8
	movs r3, #0
	bl sub_08043C28
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0803392C: .4byte 0x0000717C

