	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028568
sub_08028568: @ 0x08028568
	push {lr}
	bl sub_08027118
	bl sub_0807443C
	ldr r1, _0802857C @ =gUnknown_030032D8
	movs r0, #0x12
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802857C: .4byte gUnknown_030032D8

