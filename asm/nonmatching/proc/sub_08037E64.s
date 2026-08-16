	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037E64
sub_08037E64: @ 0x08037E64
	push {lr}
	ldr r0, _08037E84 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	bl sub_080375A4
	bl sub_08037DC8
	ldr r0, _08037E88 @ =sub_080368E8
	bl sub_080366C4
	ldr r0, _08037E8C @ =sub_08036884
	bl sub_080366D0
	pop {r0}
	bx r0
	.align 2, 0
_08037E84: .4byte gUnknown_03003FC0
_08037E88: .4byte sub_080368E8
_08037E8C: .4byte sub_08036884

