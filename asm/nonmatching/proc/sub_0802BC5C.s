	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BC5C
sub_0802BC5C: @ 0x0802BC5C
	push {lr}
	ldr r1, _0802BC78 @ =gUnknown_08090A98
	ldr r0, _0802BC7C @ =gUnknown_030033EC
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0802BBDC
	pop {r0}
	bx r0
	.align 2, 0
_0802BC78: .4byte gUnknown_08090A98
_0802BC7C: .4byte gUnknown_030033EC

