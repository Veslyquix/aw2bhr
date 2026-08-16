	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038BE0
sub_08038BE0: @ 0x08038BE0
	push {lr}
	movs r0, #1
	bl sub_080386EC
	bl sub_08038B84
	ldr r1, _08038C00 @ =gUnknown_030033E4
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	ldr r2, _08038C04 @ =gUnknown_03003110
	bl sub_0802042C
	bl sub_080389D8
	pop {r0}
	bx r0
	.align 2, 0
_08038C00: .4byte gUnknown_030033E4
_08038C04: .4byte gUnknown_03003110

