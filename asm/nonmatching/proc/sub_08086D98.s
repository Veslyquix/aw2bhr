	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086D98
sub_08086D98: @ 0x08086D98
	push {lr}
	ldr r1, _08086DB0 @ =gUnknown_02027F74
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_080247A4
	pop {r0}
	bx r0
	.align 2, 0
_08086DB0: .4byte gUnknown_02027F74

