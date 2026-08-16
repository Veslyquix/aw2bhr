	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080433F8
sub_080433F8: @ 0x080433F8
	push {r4, lr}
	ldr r4, _08043414 @ =gUnknown_085D5ABC
	movs r3, #0x1a
	muls r2, r3, r2
	adds r1, r1, r2
	movs r2, #0x5c
	muls r0, r2, r0
	adds r1, r1, r0
	adds r4, #0x1e
	adds r1, r1, r4
	ldrb r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08043414: .4byte gUnknown_085D5ABC

