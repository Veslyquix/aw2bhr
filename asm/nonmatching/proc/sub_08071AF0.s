	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071AF0
sub_08071AF0: @ 0x08071AF0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08071B08 @ =gUnknown_08613F54
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08071B28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071B08: .4byte gUnknown_08613F54

