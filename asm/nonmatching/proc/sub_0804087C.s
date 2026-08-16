	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804087C
sub_0804087C: @ 0x0804087C
	push {lr}
	ldr r0, _08040894 @ =gUnknown_0849FC64
	bl sub_080193B0
	ldr r2, _08040898 @ =gUnknown_030033E4
	ldr r1, _0804089C @ =gUnknown_03003100
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	pop {r0}
	bx r0
	.align 2, 0
_08040894: .4byte gUnknown_0849FC64
_08040898: .4byte gUnknown_030033E4
_0804089C: .4byte gUnknown_03003100

