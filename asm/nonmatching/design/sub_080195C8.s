	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080195C8
sub_080195C8: @ 0x080195C8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r2, [r4, #0x18]
	ldr r3, _080195F4 @ =0x00000C8B
	ldrh r0, [r4, #0x30]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0
	bl sub_08014A5C
	adds r0, r4, #0
	bl sub_08019578
	bl sub_0803670C
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080195F4: .4byte 0x00000C8B

