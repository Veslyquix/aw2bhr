	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037750
sub_08037750: @ 0x08037750
	push {lr}
	adds r1, r0, #0
	ldr r0, _08037774 @ =gUnknown_0300057C
	str r1, [r0]
	ldr r0, _08037778 @ =gUnknown_081253F0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0803777C @ =sub_08037790
	bl sub_08011B34
	bl sub_0803D6B8
	pop {r0}
	bx r0
	.align 2, 0
_08037774: .4byte gUnknown_0300057C
_08037778: .4byte gUnknown_081253F0
_0803777C: .4byte sub_08037790

