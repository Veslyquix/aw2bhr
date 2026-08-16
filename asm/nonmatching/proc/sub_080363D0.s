	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080363D0
sub_080363D0: @ 0x080363D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl sub_0801C240
	ldr r0, [r4, #0x48]
	bl sub_080364D4
	ldr r1, _080363F4 @ =gUnknown_03003124
	adds r4, #0x3a
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080363F4: .4byte gUnknown_03003124

