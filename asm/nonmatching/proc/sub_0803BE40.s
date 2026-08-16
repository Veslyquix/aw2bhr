	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BE40
sub_0803BE40: @ 0x0803BE40
	push {lr}
	bl sub_0801A168
	movs r0, #3
	bl sub_0803433C
	ldr r1, _0803BE58 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0803BE58: .4byte gUnknown_03002F1C

