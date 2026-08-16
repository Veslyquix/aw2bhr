	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078504
sub_08078504: @ 0x08078504
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08078520 @ =gUnknown_03002F08
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08014BC0
	ldr r0, [r4, #0x54]
	bl sub_080193B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078520: .4byte gUnknown_03002F08

