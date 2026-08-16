	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E248
sub_0801E248: @ 0x0801E248
	push {r4, lr}
	ldr r4, _0801E260 @ =gUnknown_0200F720
	lsls r3, r0, #4
	adds r3, r3, r4
	strh r1, [r3]
	strh r2, [r3, #2]
	bl sub_0801E18C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E260: .4byte gUnknown_0200F720

