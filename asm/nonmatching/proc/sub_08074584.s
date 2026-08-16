	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074584
sub_08074584: @ 0x08074584
	push {lr}
	ldr r0, _08074594 @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	bl sub_08035000
	ldr r0, [r0, #4]
	pop {r1}
	bx r1
	.align 2, 0
_08074594: .4byte gUnknown_03003FC0

