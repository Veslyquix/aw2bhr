	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E27C
sub_0801E27C: @ 0x0801E27C
	push {r4, lr}
	ldr r4, _0801E290 @ =gUnknown_0200F720
	lsls r0, r0, #4
	adds r0, r0, r4
	strh r1, [r0, #6]
	strh r2, [r0, #8]
	strh r3, [r0, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E290: .4byte gUnknown_0200F720

