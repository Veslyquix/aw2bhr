	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E22C
sub_0801E22C: @ 0x0801E22C
	push {r4, r5, lr}
	ldr r5, _0801E244 @ =gUnknown_0200F720
	lsls r4, r0, #4
	adds r4, r4, r5
	strh r1, [r4]
	strh r2, [r4, #2]
	strh r3, [r4, #4]
	bl sub_0801E18C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E244: .4byte gUnknown_0200F720

