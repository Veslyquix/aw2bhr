	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803486C
sub_0803486C: @ 0x0803486C
	push {lr}
	ldr r2, _08034884 @ =gUnknown_03003338
	ldr r0, _08034888 @ =gUnknown_0849FE74
	ldr r1, [r0]
	str r1, [r2]
	ldr r0, _0803488C @ =gUnknown_03003F20
	str r1, [r0]
	bl sub_080215D0
	pop {r0}
	bx r0
	.align 2, 0
_08034884: .4byte gUnknown_03003338
_08034888: .4byte gUnknown_0849FE74
_0803488C: .4byte gUnknown_03003F20

