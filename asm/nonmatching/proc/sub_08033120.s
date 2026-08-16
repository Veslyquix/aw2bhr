	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033120
sub_08033120: @ 0x08033120
	push {lr}
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	ldr r0, _08033148 @ =gUnknown_03002F18
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0803314C @ =gUnknown_03002B34
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08033148: .4byte gUnknown_03002F18
_0803314C: .4byte gUnknown_03002B34

