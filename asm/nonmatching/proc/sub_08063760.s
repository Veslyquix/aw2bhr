	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063760
sub_08063760: @ 0x08063760
	push {lr}
	movs r1, #0xf
	ands r1, r0
	ldr r0, _08063778 @ =gUnknown_0812B81C
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_08013618
	pop {r0}
	bx r0
	.align 2, 0
_08063778: .4byte gUnknown_0812B81C

