	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067B6C
sub_08067B6C: @ 0x08067B6C
	push {lr}
	sub sp, #4
	bl sub_08012358
	movs r0, #0
	str r0, [sp]
	ldr r1, _08067B88 @ =0x0600E000
	ldr r2, _08067B8C @ =0x01000400
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08067B88: .4byte 0x0600E000
_08067B8C: .4byte 0x01000400

