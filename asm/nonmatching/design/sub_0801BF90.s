	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BF90
sub_0801BF90: @ 0x0801BF90
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	ldrsh r4, [r1, r2]
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, [r0, #0x54]
	adds r0, #0x52
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_0801BEBC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

