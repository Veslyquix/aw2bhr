	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803927C
sub_0803927C: @ 0x0803927C
	push {lr}
	sub sp, #4
	ldr r3, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	ldr r2, _08039298 @ =0x000041CA
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl sub_08043C28
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039298: .4byte 0x000041CA

