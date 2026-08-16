	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037D64
sub_08037D64: @ 0x08037D64
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08037D7C @ =gUnknown_0849D53C
	movs r1, #0
	bl sub_080152EC
	strh r4, [r0, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037D7C: .4byte gUnknown_0849D53C

