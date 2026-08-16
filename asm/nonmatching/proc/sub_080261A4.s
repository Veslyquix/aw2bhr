	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080261A4
sub_080261A4: @ 0x080261A4
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08042DE0
	ldr r2, _080261C4 @ =gUnknown_08499608
	lsls r4, r4, #1
	subs r0, #1
	movs r1, #0x32
	muls r0, r1, r0
	adds r4, r4, r0
	adds r4, r4, r2
	ldrh r0, [r4]
	lsls r0, r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080261C4: .4byte gUnknown_08499608

