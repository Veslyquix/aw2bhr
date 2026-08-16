	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035E6C
sub_08035E6C: @ 0x08035E6C
	push {lr}
	ldr r0, _08035E88 @ =gUnknown_03005BA0
	movs r1, #1
	movs r2, #0
	bl sub_08071488
	ldr r0, _08035E8C @ =gUnknown_030059E0
	movs r1, #1
	movs r2, #0
	bl sub_08071488
	pop {r0}
	bx r0
	.align 2, 0
_08035E88: .4byte gUnknown_03005BA0
_08035E8C: .4byte gUnknown_030059E0

