	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060424
sub_08060424: @ 0x08060424
	push {lr}
	ldr r0, _08060440 @ =gUnknown_030046C0
	ldrb r0, [r0, #6]
	bl sub_080425FC
	ldr r1, _08060444 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08060448 @ =gUnknown_030045D4
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08060440: .4byte gUnknown_030046C0
_08060444: .4byte gUnknown_03004780
_08060448: .4byte gUnknown_030045D4

