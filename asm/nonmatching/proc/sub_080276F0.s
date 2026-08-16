	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080276F0
sub_080276F0: @ 0x080276F0
	push {lr}
	ldr r1, _08027708 @ =gUnknown_03003130
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0802770C @ =gUnknown_08090A98
	movs r2, #2
	ldrsh r0, [r0, r2]
	str r0, [r1, #4]
	bl sub_0804360C
	pop {r0}
	bx r0
	.align 2, 0
_08027708: .4byte gUnknown_03003130
_0802770C: .4byte gUnknown_08090A98

