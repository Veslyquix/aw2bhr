	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080276D0
sub_080276D0: @ 0x080276D0
	push {lr}
	ldr r1, _080276E8 @ =gUnknown_03003130
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080276EC @ =gUnknown_08090A98
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1, #4]
	bl sub_0804360C
	pop {r0}
	bx r0
	.align 2, 0
_080276E8: .4byte gUnknown_03003130
_080276EC: .4byte gUnknown_08090A98

