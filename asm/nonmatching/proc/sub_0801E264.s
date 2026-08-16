	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E264
sub_0801E264: @ 0x0801E264
	push {lr}
	ldr r3, _0801E278 @ =gUnknown_0200F720
	lsls r2, r0, #4
	adds r2, r2, r3
	strh r1, [r2, #4]
	bl sub_0801E18C
	pop {r0}
	bx r0
	.align 2, 0
_0801E278: .4byte gUnknown_0200F720

