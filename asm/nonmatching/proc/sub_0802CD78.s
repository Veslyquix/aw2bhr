	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CD78
sub_0802CD78: @ 0x0802CD78
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802CD9C @ =gUnknown_030040F0
	str r1, [r0]
	bl sub_0801A614
	bl sub_0801A168
	bl sub_08034F10
	ldr r0, _0802CDA0 @ =gUnknown_0849ADD0
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0802CD9C: .4byte gUnknown_030040F0
_0802CDA0: .4byte gUnknown_0849ADD0

