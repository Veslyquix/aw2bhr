	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071B0C
sub_08071B0C: @ 0x08071B0C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08071B24 @ =gUnknown_08613F74
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08071B28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071B24: .4byte gUnknown_08613F74

