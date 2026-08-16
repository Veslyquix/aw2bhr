	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035E00
sub_08035E00: @ 0x08035E00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08035E1C @ =gUnknown_03005BA0
	bl sub_08035DF4
	ldr r0, _08035E20 @ =gUnknown_030059E0
	bl sub_08035DF4
	movs r0, #0
	strh r0, [r4, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035E1C: .4byte gUnknown_03005BA0
_08035E20: .4byte gUnknown_030059E0

