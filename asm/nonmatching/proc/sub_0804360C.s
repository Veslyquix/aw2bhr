	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804360C
sub_0804360C: @ 0x0804360C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804362C @ =gUnknown_030033EC
	ldrh r2, [r0]
	adds r0, r4, #0
	movs r1, #3
	bl sub_080436DC
	adds r0, r4, #0
	movs r1, #6
	bl sub_0804365C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804362C: .4byte gUnknown_030033EC

