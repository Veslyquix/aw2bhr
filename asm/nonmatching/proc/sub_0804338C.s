	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804338C
sub_0804338C: @ 0x0804338C
	push {lr}
	ldr r2, _080433B4 @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r0, [r2]
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	bl sub_08042FFC
	pop {r1}
	bx r1
	.align 2, 0
_080433B4: .4byte gUnknown_08499594

