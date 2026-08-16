	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080670D8
sub_080670D8: @ 0x080670D8
	push {lr}
	ldr r0, _080670F4 @ =gUnknown_08580DD8
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mvns r0, r0
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080670F4: .4byte gUnknown_08580DD8

