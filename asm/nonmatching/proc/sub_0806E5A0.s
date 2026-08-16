	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E5A0
sub_0806E5A0: @ 0x0806E5A0
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r1, _0806E5C8 @ =0x000001FF
	ands r0, r1
	ldr r1, [r2, #0x30]
	movs r2, #0xff
	ands r1, r2
	movs r2, #0x92
	lsls r2, r2, #4
	movs r3, #1
	str r3, [sp]
	movs r3, #0
	bl sub_08043C28
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0806E5C8: .4byte 0x000001FF

