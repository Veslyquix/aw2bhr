	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B1CC
sub_0803B1CC: @ 0x0803B1CC
	ldr r0, _0803B1E4 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B1E2
	ldr r1, _0803B1E8 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
_0803B1E2:
	bx lr
	.align 2, 0
_0803B1E4: .4byte gUnknown_03002EE0
_0803B1E8: .4byte gUnknown_03002F1C

