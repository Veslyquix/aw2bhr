	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CD28
sub_0802CD28: @ 0x0802CD28
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802CD4C @ =gUnknown_030040F0
	str r1, [r0]
	bl sub_0801A614
	bl sub_0801A168
	bl sub_08034F10
	ldr r0, _0802CD50 @ =gUnknown_0849AA68
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802CD4C: .4byte gUnknown_030040F0
_0802CD50: .4byte gUnknown_0849AA68

